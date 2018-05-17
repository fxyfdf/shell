for line in `cat ip.txt`
do
  ssh -p59522 root@$line "mkdir /opt/elk/"
  scp -P59522 -r  /data/lpf/flume-1.7.0-dftthadoop2  $line:/opt/elk/
  #scp -P59522 -r  /data/lpf/flume-1.7.0  $line:/opt/elk/
  scp -P59522 -r  /data/lpf/flume-1.7.0-ecgdbr  $line:/opt/elk/
  scp -P59522  -r /data/lpf/flume-1.7.0-tefam0  $line:/opt/elk/
  ssh -p59522 $line "chown hadoop:hadoop -R /opt/elk"
  ssh -p59522 root@$line "su - hadoop -c 'ln -s /opt/dftthadoop2/etc/hadoop/hdfs-site.xml /opt/elk/flume-1.7.0-dftthadoop2/conf/hdfs-site.xml '"
  ssh -p59522 root@$line "su - hadoop -c 'ln -s /opt/dftthadoop2/etc/hadoop/core-site.xml /opt/elk/flume-1.7.0-dftthadoop2/conf/core-site.xml '"
  ssh -p59522 root@$line "su - hadoop -c 'ln -s /opt/hadoop-ecgdbr/etc/hadoop/hdfs-site.xml /opt/elk/flume-1.7.0-ecgdbr/conf/hdfs-site.xml'"
  ssh -p59522 root@$line "su - hadoop -c 'ln -s /opt/hadoop-ecgdbr/etc/hadoop/core-site.xml /opt/elk/flume-1.7.0-ecgdbr/conf/core-site.xml  '"
  ssh -p59522 root@$line "su - hadoop -c 'ln -s /opt/hadoop-tefam0/etc/hadoop/hdfs-site.xml /opt/elk/flume-1.7.0-tefam0/conf/hdfs-site.xml'"
  ssh -p59522 root@$line "su - hadoop -c 'ln -s /opt/hadoop-tefam0/etc/hadoop/core-site.xml /opt/elk/flume-1.7.0-tefam0/conf/core-site.xml '"
  ssh -p59522 $line "chown hadoop:hadoop -R /opt/elk"
  echo $line
done
