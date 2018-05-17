for line in `cat ip.txt`
do
  ssh -p52222    root@$line 'useradd hadoop'
  ssh -P52222 -r  .bash_profile  $line:/home/hadoop
  scp -P52222    root@$line 'mkdir /opt/elk'
  scp -P52222 -r  /data/lpf/dftthadoop  $line:/opt/
  scp -P52222 -r  /data/lpf/dftthadoop2  $line:/opt/
  scp -P52222 -r  /data/lpf/hadoop-ecgdbr  $line:/opt/ 
  scp -P52222  -r /data/lpf/hadoop-tefam0  $line:/opt/
  scp -P52222  -r /data/lpf/jdk  $line:/opt/
  ssh -p52222 $line 'chown hadoop:hadoop -R /opt/'
  ssh -p52222 $line 'source /etc/profile'
  echo $line
done
