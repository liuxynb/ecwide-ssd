#!/bin/bash

while true; do
  echo "Removing..."
  ssh femu@node01 'rm -f /mnt/nvme0/D_1_0'

  echo "Transferring..."
  rsync -azP /home/femu/ecwide-ssd/test/chunks/D_1_0 femu@node01:/mnt/nvme0/D_1_0

  echo "One round done. Sleep 1s."
  sleep 1
done