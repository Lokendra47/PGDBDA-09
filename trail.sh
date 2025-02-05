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

