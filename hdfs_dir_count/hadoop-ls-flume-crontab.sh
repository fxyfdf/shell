
j=0
for i in `cat hdfs_dir_1.txt`
do
j=$((j+1))
echo "----------${j}----------------"
echo $i
/opt/hadoop-ecgdbr/bin/hadoop fs -ls $i/dt=20180516 | head -n3

done
