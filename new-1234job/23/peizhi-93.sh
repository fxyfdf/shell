#!/bin/sh
read -p "please input your log_path  " log_path
read -p "please input your log_name  " log_name
read -p "please input your hdfs_path  " hdfs_path

echo ${log_name} > log_name.txt

# log_name2
sed -i "8c a1.sources.r1.command  = tail -n0 -F $log_path" default.conf 
sed -i "24c a1.sinks.k1.hdfs.path = hdfs://dftthd2cluster${hdfs_path}/dt=%Y%m%d" default.conf
sed -i "25c a1.sinks.k1.hdfs.filePrefix = ${log_name}9_%Y%m%d%H%M" default.conf
sed -i "15c a1.channels.c1.checkpointDir = /data/flume/checkpoint/${log_name}9" default.conf
sed -i "16c a1.channels.c1.dataDirs = /data/flume/data/${log_name}9" default.conf
\cp default.conf ${log_name}9.conf

# log_name3
sed -i "8c a1.sources.r1.command  = tail -n0 -F $log_path" default.conf 
sed -i "24c a1.sinks.k1.hdfs.path = hdfs://Ucluster${hdfs_path}/dt=%Y%m%d" default.conf
sed -i "25c a1.sinks.k1.hdfs.filePrefix = ${log_name}3_%Y%m%d%H%M" default.conf
sed -i "15c a1.channels.c1.checkpointDir = /data/flume/checkpoint/${log_name}3" default.conf
sed -i "16c a1.channels.c1.dataDirs = /data/flume/data/${log_name}3" default.conf

\cp default.conf ${log_name}3.conf


