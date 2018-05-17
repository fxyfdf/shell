for hfds_dir in `cat hdfs_dir_1.txt`
do
echo $hfds_dir
/opt/hadoop-s5qy3u/bin/hadoop fs -ls ${hfds_dir}/dt=20180517  |grep -v items | awk -F'.log.10' '{print "10"$2}' | grep -v tmp | sort |uniq | wc -l
/opt/dftthadoop/bin/hadoop fs -ls ${hfds_dir}/dt=20180517  |grep -v items | awk -F'.log.10' '{print "10"$2}' | grep -v tmp | sort |uniq | wc -l
/opt/hadoop-s5qy3u/bin/hadoop fs -ls ${hfds_dir}/| wc -l
/opt/dftthadoop/bin/hadoop fs -ls ${hfds_dir}/ |wc -l
done
