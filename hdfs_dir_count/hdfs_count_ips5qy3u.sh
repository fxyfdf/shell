for hfds_dir in `cat hdfs_dir-s5qy3u.txt`
do
echo $hfds_dir
/data/lpf/hadoop-s5qy3u/bin/hadoop fs -ls ${hfds_dir}/dt=20180502  |grep -v items | awk -F'.log.10' '{print "10"$2}' | grep -v tmp | sort |uniq | wc -l
/data/lpf/dftthadoop/bin/hadoop fs -ls ${hfds_dir}/dt=20180502  |grep -v items | awk -F'.log.10' '{print "10"$2}' | grep -v tmp | sort |uniq | wc -l
/data/lpf/hadoop-s5qy3u/bin/hadoop fs -ls ${hfds_dir}/| wc -l
/data/lpf/dftthadoop/bin/hadoop fs -ls ${hfds_dir}/ |wc -l
done
