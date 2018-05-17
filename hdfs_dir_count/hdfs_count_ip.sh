for hfds_dir in `cat hdfs_dir.txt`
do
echo $hfds_dir
/data/lpf/hadoop-5nxpdx/bin/hadoop fs -ls ${hfds_dir}/dt=20180502  |grep -v items | awk -F'.log.10' '{print "10"$2}' | grep -v tmp | sort |uniq | wc -l
#/data/lpf/dftthadoop/bin/hadoop fs -ls ${hfds_dir}/dt=20180427  |grep -v items | awk -F'.log.10' '{print "10"$2}' | grep -v tmp | sort |uniq | wc -l
done
