for i in `cat table_name_cheatdb.txt`
do
echo $i
 /opt/dftthadoop/bin/hadoop fs -du -s -h /user/hive/warehouse/$1.db/$i/dt=20180507
done
