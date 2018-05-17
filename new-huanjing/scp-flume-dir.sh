log_name="tagshow"
for line in `cat ip.txt`
do
  ssh -p52222 root@$line 'mkdir /opt/elk/'
  scp -P52222  -r /data/lpf/flume-1.7.0-ecgdbr  $line:/opt/elk/
  #scp -P52222  -r /data/lpf/flume-1.7.0  $line:/opt/elk/
  ssh -p52222 $line 'chown hadoop:hadoop -R /opt/elk/'
  ssh -p52222 $line 'rm -f /opt/elk/flume-1.7.0/conf/task_add_bonus_performance.conf'
  ssh -p52222 $line 'rm -f /opt/elk/flume-1.7.0/conf/gin_guc.conf '
  echo $line
done
