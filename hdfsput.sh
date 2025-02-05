#!/bin/bash

# Define the source directory as the current working directory
local_dir="$(pwd)/flight_2018"

# Define the destination directory in HDFS
hdfs_dir="/user/talentum/flight_2018"

# Define the block size for HDFS (128 MB)
block_size="134217728"

# Check if the HDFS directory exists
if hdfs dfs -test -d "$hdfs_dir"; then
  echo "Directory $hdfs_dir exists."
  # Optionally, you can remove the directory if needed
  hdfs dfs -rm -R "$hdfs_dir"
else
  echo "Directory $hdfs_dir does not exist."
  # Create the directory in HDFS
  hdfs dfs -mkdir "$hdfs_dir"
  echo "Directory $hdfs_dir created."
fi

# Loop through the files and upload them to HDFS
for i in {1..12}
do
  local_file="${local_dir}/Flights_2018_${i}.csv"
  hdfs_file="${hdfs_dir}/Flights_2018_${i}"
  # Check if file exists
  if [ ! -f "$local_file" ]; then
    echo "Warning: $local_file not found, skipping..."
    continue
  fi

  # Upload to HDFS
  hdfs dfs -D dfs.blocksize=$block_size -put "$local_file" "$hdfs_file" && \
  echo "Successfully copied $local_file to $hdfs_dir" || \
  echo "Error copying $local_file"
done

