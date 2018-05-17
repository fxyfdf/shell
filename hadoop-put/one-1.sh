for ip_line in `cat ip.txt`
do
log_name_dir=/data/h5_socketlogs/pageshowbak/pageshowbak.log
hdfs_dir1=/user/hive/warehouse/adverdb.db/log_adx_adver_app_adxerror/dt=20180502
hdfs_dir2=/user/hive/warehouse/minieastdaywap.db/temp_miniwap_show_realtime/dt=20180511/pageshowbak.log-2018-05-11.log1

#ssh -p59522 -tt ${ip_line} "su - hadoop -c '/opt/hadoop/bin/hadoop fs -put ${log_name_dir} ${hdfs_dir}.${ip_line} & '" >> hdfs.log 2>&1 &
#ssh -p59522 -tt ${ip_line} "su - hadoop -c '/opt/dftthadoop/bin/hadoop fs -rm ${hdfs_dir1}/*.${ip_line} & '" >> hdfs.log 2>&1 &
#ssh -p59522 -tt ${ip_line} "su - hadoop -c '/opt/dftthadoop/bin/hadoop fs -put ${log_name_dir} ${hdfs_dir2}.${ip_line} & '" >> hdfs.log 2>&1 &
#ssh -p59522 -tt ${ip_line} "su - hadoop -c '/opt/hadoop/bin/hadoop fs -put ${log_name_dir} ${hdfs_dir2}.${ip_line} & '" >> hdfs.log 2>&1 &
#ssh -p59522 -tt ${ip_line} "su - hadoop -c '/opt/dftthadoop2/bin/hadoop fs -put ${log_name_dir} ${hdfs_dir2}.${ip_line} & '" >> hdfs.log 2>&1 &
ssh -p59522 -tt ${ip_line} "su - hadoop -c '/opt/hadoop-ecgdbr/bin/hadoop fs -put ${log_name_dir} ${hdfs_dir2}.${ip_line} & '" >> hdfs.log 2>&1 &
#ssh -p59522 -tt ${ip_line} "su - hadoop -c '/opt/hadoop-tefam0/bin/hadoop fs -put ${log_name_dir} ${hdfs_dir2}.${ip_line} & '" >> hdfs.log 2>&1 &

done

