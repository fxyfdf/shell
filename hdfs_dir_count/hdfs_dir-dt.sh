time1=`date +%Y%m%d`
#time1=`date +%Y%m%d%H%M -d "10 minutes ago"`
time2=`date +%Y%m%d -d "1 minutes ago"`
datenow=`date +%Y-%m-%d-%T`
time1=20180509
for hfds_dir in `cat hdfs_dir-dt.txt`
do
echo $hfds_dir
#/data/lpf/hadoop-5nxpdx/bin/hadoop fs -ls ${hfds_dir}/dt=${time1}  |grep -v items | awk -F'.log.10' '{print "10"$2}' | grep -v tmp | sort |uniq | wc -l
#/data/lpf/dftthadoop/bin/hadoop fs -ls ${hfds_dir}/dt=${time1}  |grep -v items | awk -F'.log.10' '{print "10"$2}' | grep -v tmp | sort |uniq | wc -l
echo "/opt/dftthadoop/bin/hadoop"
/opt/dftthadoop/bin/hadoop fs -ls ${hfds_dir}/dt=${time1} |wc -l 
echo "/opt/hadoop-ecgdbr/bin/hadoop"
/opt/hadoop-ecgdbr/bin/hadoop fs -ls ${hfds_dir}/dt=${time1}  | wc -l
#/data/lpf/hadoop-5nxpdx/bin/hadoop fs -ls ${hfds_dir}/ | wc -l
#/data/lpf/dftthadoop/bin/hadoop fs -ls ${hfds_dir}/ | wc -l
done
