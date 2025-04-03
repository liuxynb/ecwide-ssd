package main

import (
	"bufio"
	"fmt"
	"log"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
	"strings"
	"sync"
	"time"
)

const (
	userName  = "femu"
	javaPath  = "${JAVA_HOME}/bin/java"
	workDir   = "/home/femu/ecwide-ssd"
	chunksDir = "/home/femu/ecwide-ssd/test/chunks"
	dataSource = "zero"
)

type Block struct {
	Type     string // "D", "L", "G"
	StripeID int
	BlockID  int
}

func (b Block) String() string {
	return fmt.Sprintf("%s_%d_%d", b.Type, b.StripeID, b.BlockID)
}

type Distribution map[string][]Block

// Creates a distribution plan for erasure code stripes across racks and disks
func createStripeDistribution(numRacks, disksPerRack, numStripes, dataBlocks, localParityBlocks, globalParityBlocks int) Distribution {
	// Seed random number generator
	rand.Seed(time.Now().UnixNano())
	
	// Initialize distribution structure
	distribution := make(Distribution)
	for rack := 1; rack <= numRacks; rack++ {
		for disk := 1; disk <= disksPerRack; disk++ {
			key := fmt.Sprintf("%d_%d", rack, disk)
			distribution[key] = []Block{}
		}
	}
	
	// For each rack, designate one disk for local parity blocks
	localParityDisks := make(map[int]int)
	for rack := 1; rack <= numRacks; rack++ {
		localParityDisks[rack] = rand.Intn(disksPerRack) + 1
	}
	
	// Allocate blocks for each stripe
	for stripeID := 1; stripeID <= numStripes; stripeID++ {
		// Distribute local parity blocks (4 per stripe)
		// Randomly select racks for local parity blocks
		racks := make([]int, numRacks)
		for i := 0; i < numRacks; i++ {
			racks[i] = i + 1
		}
		rand.Shuffle(len(racks), func(i, j int) { racks[i], racks[j] = racks[j], racks[i] })
		
		lpRacks := racks[:localParityBlocks]
		for i, rack := range lpRacks {
			disk := localParityDisks[rack]
			key := fmt.Sprintf("%d_%d", rack, disk)
			distribution[key] = append(distribution[key], Block{
				Type:     "L",
				StripeID: stripeID,
				BlockID:  i + 1,
			})
		}
		
		// Distribute global parity blocks (2 per stripe)
		// Each disk can have at most one global parity block
		var availableSlots []string
		for rack := 1; rack <= numRacks; rack++ {
			for disk := 1; disk <= disksPerRack; disk++ {
				// Skip disks already containing local parity blocks
				if disk == localParityDisks[rack] {
					continue
				}
				
				// Check if this disk already has a global parity block
				key := fmt.Sprintf("%d_%d", rack, disk)
				hasGlobal := false
				for _, block := range distribution[key] {
					if block.Type == "G" {
						hasGlobal = true
						break
					}
				}
				
				if !hasGlobal {
					availableSlots = append(availableSlots, key)
				}
			}
		}
		
		// Ensure we have enough slots for global parity blocks
		if len(availableSlots) < globalParityBlocks {
			log.Fatal("Not enough available slots for global parity blocks")
		}
		
		// Select slots for global parity blocks
		rand.Shuffle(len(availableSlots), func(i, j int) { 
			availableSlots[i], availableSlots[j] = availableSlots[j], availableSlots[i] 
		})
		
		gpSlots := availableSlots[:globalParityBlocks]
		for i, slot := range gpSlots {
			distribution[slot] = append(distribution[slot], Block{
				Type:     "G",
				StripeID: stripeID,
				BlockID:  i + 1,
			})
			
			// Remove used slot from available slots
			for j, avSlot := range availableSlots {
				if avSlot == slot {
					availableSlots = append(availableSlots[:j], availableSlots[j+1:]...)
					break
				}
			}
		}
		
		// Distribute data blocks (20 per stripe)
		// For each data block, find a disk that doesn't already have blocks from this stripe
		for i := 1; i <= dataBlocks; i++ {
			placed := false
			attempts := 0
			maxAttempts := 100 // Prevent infinite loops
			
			for !placed && attempts < maxAttempts {
				rack := rand.Intn(numRacks) + 1
				disk := rand.Intn(disksPerRack) + 1
				key := fmt.Sprintf("%d_%d", rack, disk)
				
				// Skip disks that already have blocks from this stripe
				hasSameStripe := false
				for _, block := range distribution[key] {
					if block.StripeID == stripeID {
						hasSameStripe = true
						break
					}
				}
				
				if !hasSameStripe {
					distribution[key] = append(distribution[key], Block{
						Type:     "D",
						StripeID: stripeID,
						BlockID:  i,
					})
					placed = true
				}
				
				attempts++
			}
			
			if !placed {
				log.Fatalf("Failed to place data block %d for stripe %d", i, stripeID)
			}
		}
	}
	
	return distribution
}

// Generates chunk files based on the distribution plan
func generateChunkFiles(distribution Distribution, outputDir string) {
	// Create output directory if it doesn't exist
	if err := os.MkdirAll(outputDir, 0755); err != nil {
		log.Fatalf("Failed to create output directory: %v", err)
	}
	
	// Create a file for each (rack, disk) pair with its blocks
	for key, blocks := range distribution {
		filePath := filepath.Join(outputDir, key+"_chunks.txt")
		file, err := os.Create(filePath)
		if err != nil {
			log.Fatalf("Failed to create file %s: %v", filePath, err)
		}
		defer file.Close()
		
		writer := bufio.NewWriter(file)
		for _, block := range blocks {
			if _, err := fmt.Fprintf(writer, "%s,%d,%d\n", block.Type, block.StripeID, block.BlockID); err != nil {
				log.Fatalf("Failed to write to file %s: %v", filePath, err)
			}
		}
		
		if err := writer.Flush(); err != nil {
			log.Fatalf("Failed to flush file %s: %v", filePath, err)
		}
	}
}

// Execute a command and return its output as a string
func executeCommand(command string) string {
	cmd := exec.Command("bash", "-c", command)
	output, err := cmd.CombinedOutput()
	if err != nil {
		log.Printf("Error executing command '%s': %v", command, err)
	}
	return strings.TrimSpace(string(output))
}

// Execute a command without capturing the output
func executeCommandNoOutput(command string) {
	cmd := exec.Command("bash", "-c", command)
	if err := cmd.Run(); err != nil {
		log.Printf("Error executing command '%s': %v", command, err)
	}
}

// Execute a function for each node in parallel
func multithreadWork(n int, fn func(int, ...interface{}), args ...interface{}) {
	var wg sync.WaitGroup
	for i := 1; i <= n; i++ {
		wg.Add(1)
		go func(index int) {
			defer wg.Done()
			fn(index, args...)
		}(i)
	}
	wg.Wait()
}

// Send files to a single node
func sendOne(index int, args ...interface{}) {
	flag := args[0].(string)
	
	var cmd string
	if flag == "program" {
		cmd = fmt.Sprintf("scp -r ./classes/ ./lib/ ./util/ %s@node%02d:%s/", userName, index, workDir)
	} else if flag == "config" {
		cmd = fmt.Sprintf("scp ./config/* %s@node%02d:%s/config/", userName, index, workDir)
	} else {
		outBytes := executeCommand(fmt.Sprintf("ls %s/%d_*", chunksDir, index))
		cmd = fmt.Sprintf("scp %s %s@node%02d:/tmp/stdfile", outBytes, userName, index)
	}
	
	executeCommandNoOutput(cmd)
}

// Update nodes with configuration or program
func update(n int, updateType string) {
	if updateType == "all" {
		generateNodesConfig(n)
		multithreadWork(n, sendOne, "config")
		multithreadWork(n, sendOne, "program")
	} else {
		if updateType == "config" {
			generateNodesConfig(n)
		}
		multithreadWork(n, sendOne, updateType)
	}
	fmt.Printf("update %s ok\n", updateType)
}

// Start a single node
func startSingleNode(index int, args ...interface{}) {
	cmd := fmt.Sprintf("ssh %s@node%02d \"source /etc/profile;cd %s;nohup %s DataNode %d > output.log 2>&1 &\"", 
		userName, index, workDir, javaPath, index)
	executeCommandNoOutput(cmd)
}

// Stop a single node
func stopSingleNode(index int, args ...interface{}) {
	cmd := fmt.Sprintf("ssh %s@node%02d \"pkill java\"", userName, index)
	executeCommandNoOutput(cmd)
}

// Start the cluster
func startCluster(n int) {
	executeCommandNoOutput("nohup java MasterNode > output.log 2>&1 &")
	multithreadWork(n, startSingleNode)
	fmt.Println("start_cluster ok")
}

// Stop the cluster
func stopCluster(n int) {
	multithreadWork(n, stopSingleNode)
	executeCommandNoOutput("pkill java")
	fmt.Println("stop_cluster ok")
}

// Generate node configuration
func generateNodesConfig(n int) {
	file, err := os.Open("config/nodes_ip.txt")
	if err != nil {
		log.Fatalf("Failed to open nodes_ip.txt: %v", err)
	}
	defer file.Close()
	
	scanner := bufio.NewScanner(file)
	var lines []string
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	
	if len(lines) > 0 {
		outFile, err := os.Create("config/nodes.ini")
		if err != nil {
			log.Fatalf("Failed to create nodes.ini: %v", err)
		}
		defer outFile.Close()
		
		writer := bufio.NewWriter(outFile)
		for i := 0; i <= n && i < len(lines); i++ {
			if _, err := fmt.Fprintln(writer, lines[i]); err != nil {
				log.Fatalf("Failed to write to nodes.ini: %v", err)
			}
		}
		
		if err := writer.Flush(); err != nil {
			log.Fatalf("Failed to flush nodes.ini: %v", err)
		}
	}
	
	fmt.Println("generate_config ok")
}

// Get node chunk info
func getNodeChunkInfo(n int) [][]string {
	result := make([][]string, n+1)
	
	outBytes := executeCommand(fmt.Sprintf("ls %s", chunksDir))
	names := strings.Split(outBytes, "\n")
	
	for _, name := range names {
		if name == "" {
			continue
		}
		
		s := strings.Split(name, "_")
		if len(s) < 3 {
			continue
		}
		
		node, err := strconv.Atoi(s[0])
		if err != nil || node > n {
			continue
		}
		
		result[node] = []string{s[1], s[2]}
	}
	
	return result
}

// Call single copy
func callSingleCopy(index int, args ...interface{}) {
	num := args[0].(int)
	info := args[1].([]string)
	
	if len(info) < 2 {
		log.Printf("Missing chunk info for node %d", index)
		return
	}
	
	chunkType, chunkID := info[0], info[1]
	cmd := fmt.Sprintf("ssh %s@node%02d \"cd %s;bash util/copy_chunks.sh %d %s %s\"", 
		userName, index, workDir, num, chunkType, chunkID)
	executeCommandNoOutput(cmd)
}

// Call single clean
func callSingleClean(index int, args ...interface{}) {
	cmd := fmt.Sprintf("ssh %s@node%02d \"mkdir -p %s;rm -f %s/* \"", 
		userName, index, chunksDir, chunksDir)
	executeCommandNoOutput(cmd)
}

// Distribute chunks
func distributeChunks(n, numStripes int) {
	// Clean chunks directory
	executeCommandNoOutput(fmt.Sprintf("mkdir -p %s;rm -f %s/*", chunksDir, chunksDir))
	
	// Create the distribution plan - 8 racks with 6 disks each
	numRacks := 8
	disksPerRack := 6
	distribution := createStripeDistribution(
		numRacks,
		disksPerRack,
		numStripes,
		20, // data blocks
		4,  // local parity blocks
		2,  // global parity blocks
	)
	
	// Generate chunk files based on the distribution
	generateChunkFiles(distribution, chunksDir)
	
	// Now process as usual
	executeCommandNoOutput(fmt.Sprintf("java -Xmx8192m ChunkGenerator %s toy", dataSource))
	update(n, "std_chunks")
	info := getNodeChunkInfo(n)
	multithreadWork(n, callSingleClean)
	
	// Call for copying
	var wg sync.WaitGroup
	for i := 1; i <= n; i++ {
		if len(info[i]) < 2 {
			continue
		}
		
		wg.Add(1)
		go func(index int) {
			defer wg.Done()
			callSingleCopy(index, numStripes, info[index])
		}(i)
	}
	wg.Wait()
	
	fmt.Println("distribute_chunks ok")
}

// Print distribution statistics
func printDistributionStats(distribution Distribution) {
	// Count block types
	blockTypes := map[string]int{
		"D": 0,
		"L": 0,
		"G": 0,
	}
	
	for _, blocks := range distribution {
		for _, block := range blocks {
			blockTypes[block.Type]++
		}
	}
	
	fmt.Println("Block distribution statistics:")
	fmt.Printf("Total data blocks: %d\n", blockTypes["D"])
	fmt.Printf("Total local parity blocks: %d\n", blockTypes["L"])
	fmt.Printf("Total global parity blocks: %d\n", blockTypes["G"])
	
	// Verify constraints are met
	for key, blocks := range distribution {
		stripeBlocks := make(map[int]int)
		globalParityCount := 0
		localParityCount := 0
		
		parts := strings.Split(key, "_")
		rack, _ := strconv.Atoi(parts[0])
		disk, _ := strconv.Atoi(parts[1])
		
		for _, block := range blocks {
			if block.Type == "G" {
				globalParityCount++
			} else if block.Type == "L" {
				localParityCount++
			}
			
			// Track blocks per stripe
			stripeBlocks[block.StripeID]++
		}
		
		// Check constraints
		for stripeID, count := range stripeBlocks {
			if count > 1 {
				fmt.Printf("Warning: Rack %d, Disk %d has %d blocks from stripe %d\n", rack, disk, count, stripeID)
			}
		}
		
		if globalParityCount > 1 {
			fmt.Printf("Warning: Rack %d, Disk %d has %d global parity blocks\n", rack, disk, globalParityCount)
		}
	}
}

func main() {
	if len(os.Args) < 2 {
		printUsage()
		return
	}
	
	switch os.Args[1] {
	case "nodes_config":
		if len(os.Args) != 3 {
			printUsage()
			return
		}
		n, _ := strconv.Atoi(os.Args[2])
		generateNodesConfig(n)
		
	case "update":
		if len(os.Args) != 4 {
			printUsage()
			return
		}
		updateType := os.Args[2]
		n, _ := strconv.Atoi(os.Args[3])
		update(n, updateType)
		
	case "start":
		if len(os.Args) != 3 {
			printUsage()
			return
		}
		n, _ := strconv.Atoi(os.Args[2])
		startCluster(n)
		
	case "stop":
		if len(os.Args) != 3 {
			printUsage()
			return
		}
		n, _ := strconv.Atoi(os.Args[2])
		stopCluster(n)
		
	case "distribute_chunks":
		if len(os.Args) != 4 {
			printUsage()
			return
		}
		n, _ := strconv.Atoi(os.Args[2])
		stripeNum, _ := strconv.Atoi(os.Args[3])
		distributeChunks(n, stripeNum)
		
	default:
		printUsage()
	}
}

func printUsage() {
	fmt.Println("Usage: start  n")
	fmt.Println("   Or: stop  n")
	fmt.Println("   Or: update  [all/config/program]  n")
	fmt.Println("   Or: distribute_chunks  n  stripe_num")
	fmt.Println("   Or: nodes_config  n")
}