import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileOp {
  /**
   * Reads data from a file into the provided ByteBuffer
   * 
   * @param b The ByteBuffer to read data into
   * @param filename The name of the file to read from
   */
  public static void readFile(ByteBuffer b, String filename) {
    try {
      RandomAccessFile file = new RandomAccessFile(filename, "r");
      FileChannel channel = file.getChannel();
      int n, remain = b.capacity();
      b.clear();
      while (remain > 0 && (n = channel.read(b)) > 0) {
        remain -= n;
      }
      channel.close();
      file.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  /**
   * Writes data from ByteBuffer to a file
   * 
   * @param b The ByteBuffer containing data to write
   * @param filename The name of the file to write to
   */
  public static void writeFile(ByteBuffer b, String filename) {
    try {
      RandomAccessFile file = new RandomAccessFile(filename, "rw");
      FileChannel channel = file.getChannel();
      int n, remain = b.capacity();
      b.clear();
      while (remain > 0 && (n = channel.write(b)) > 0) {
        remain -= n;
      }
      channel.close();
      file.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  /**
   * Reads data from a file on a specific disk into the provided ByteBuffer
   * 
   * @param b The ByteBuffer to read data into
   * @param diskPath Path to the specific disk (e.g., "/mnt/disk1" or "D:")
   * @param relativeFilePath The relative path on the specified disk
   */
  public static void readFileFromDisk(ByteBuffer b, String diskPath, String relativeFilePath) {
    try {
      Path fullPath = Paths.get(diskPath, relativeFilePath);
      RandomAccessFile file = new RandomAccessFile(fullPath.toString(), "r");
      FileChannel channel = file.getChannel();
      int n, remain = b.capacity();
      b.clear();
      while (remain > 0 && (n = channel.read(b)) > 0) {
        remain -= n;
      }
      channel.close();
      file.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  /**
   * Writes data from ByteBuffer to a file on a specific disk
   * 
   * @param b The ByteBuffer containing data to write
   * @param diskPath Path to the specific disk (e.g., "/mnt/disk1" or "D:")
   * @param relativeFilePath The relative path on the specified disk
   */
  public static void writeFileToDisk(ByteBuffer b, String diskPath, String relativeFilePath) {
    try {
      Path fullPath = Paths.get(diskPath, relativeFilePath);
      RandomAccessFile file = new RandomAccessFile(fullPath.toString(), "rw");
      FileChannel channel = file.getChannel();
      int n, remain = b.capacity();
      b.clear();
      while (remain > 0 && (n = channel.write(b)) > 0) {
        remain -= n;
      }
      channel.close();
      file.close();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}