
for line in `cat ip.txt`
do
  #添加用户，拷贝配置文件
  ssh -p52222  root@$line 'useradd hadoop'
  scp -P52222 -r  .bash_profile  $line:/home/hadoop
  ssh -p52222 $line 'chown hadoop:hadoop -R /home/hadoop/.bash_profile'
  #拷贝flume dir
  ssh -p52222 root@$line 'mkdir /opt/elk/'
  scp -P52222  -r /data/lpf/flume-1.7.0-ecgdbr  $line:/opt/elk/
  scp -P52222  -r /data/lpf/flume-1.7.0  $line:/opt/elk/
  scp -P52222  -r flume-1.7.0-tefam0  $line:/opt/elk/
  scp -P52222  -r /data/lpf/flume-1.7.0-dftthadoop2  $line:/opt/elk/
  #拷贝hadoop dir
  scp -P52222 -r  /data/lpf/dftthadoop  $line:/opt/
  scp -P52222 -r  /data/lpf/dftthadoop2  $line:/opt/
  scp -P52222 -r  /data/lpf/hadoop-ecgdbr  $line:/opt/ 
  scp -P52222  -r /data/lpf/hadoop-tefam0  $line:/opt/
  #对应软连接
  ssh -p52222 root@$line "su - hadoop -c 'ln -s /opt/dftthadoop2/etc/hadoop/hdfs-site.xml /opt/elk/flume-1.7.0-dftthadoop2/conf/hdfs-site.xml '"
  ssh -p52222 root@$line "su - hadoop -c 'ln -s /opt/dftthadoop2/etc/hadoop/core-site.xml /opt/elk/flume-1.7.0-dftthadoop2/conf/core-site.xml '"
  ssh -p52222 root@$line "su - hadoop -c 'ln -s /opt/hadoop-ecgdbr/etc/hadoop/hdfs-site.xml /opt/elk/flume-1.7.0-ecgdbr/conf/hdfs-site.xml'"
  ssh -p52222 root@$line "su - hadoop -c 'ln -s /opt/hadoop-ecgdbr/etc/hadoop/core-site.xml /opt/elk/flume-1.7.0-ecgdbr/conf/core-site.xml  '"
  ssh -p52222 root@$line "su - hadoop -c 'ln -s /opt/hadoop-tefam0/etc/hadoop/hdfs-site.xml /opt/elk/flume-1.7.0-tefam0/conf/hdfs-site.xml'"
  ssh -p52222 root@$line "su - hadoop -c 'ln -s /opt/hadoop-tefam0/etc/hadoop/core-site.xml /opt/elk/flume-1.7.0-tefam0/conf/core-site.xml '"

  #拷贝jdk
  scp -P52222  -r /data/lpf/jdk  $line:/opt/
  ssh -p52222 $line 'chown hadoop:hadoop -R /opt/'

  echo $line

  echo $line
done


