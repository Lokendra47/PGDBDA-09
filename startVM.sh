#!/bin/bash

# Format HDFS (be careful with this, as it will erase data)
hdfs namenode -format

# Start HDFS
./run-hdfs.sh -s start
if [ $? -ne 0 ]; then
  echo "HDFS failed to start"
  exit 1
fi

# Create necessary HDFS directories
hdfs dfs -mkdir -p /user/talentum
hdfs dfs -mkdir -p /user/hive/warehouse

# Start Hive Metastore
./run-hivemetastore.sh -s start
if [ $? -ne 0 ]; then
  echo "Hive Metastore failed to start"
  exit 1
fi

# Start HiveServer2
./run-hiveserver2.sh -s start
if [ $? -ne 0 ]; then
  echo "HiveServer2 failed to start"
  exit 1
fi

# Start YARN
./run-yarn.sh -s start
if [ $? -ne 0 ]; then
  echo "YARN failed to start"
  exit 1
fi

# Check if processes are running
jps




