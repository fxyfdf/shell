for i in `cat table.txt`
do
echo $i
echo `/opt/dftthadoop/bin/hadoop fs -ls $i/dt=20180301 | awk -F '.log.10' '{print 10$2}' | sort | uniq | grep -v tmp`
done

