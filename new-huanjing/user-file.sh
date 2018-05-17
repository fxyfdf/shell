for line in `cat ip.txt`
do
  #ssh -p52222    root@$line 'userdel hadoop'
  #ssh -p52222    root@$line 'useradd hadoop'
  #ssh -p52222    root@$line 'rm -f /opt/elk/flume-1.7.0-ecgdbr/conf/task_add_bonus_performance3.conf'
  scp -P52222 -  /data/lpf/flume-sh/new-flume-maomao/.bash_profile  $line:/home/hadoop/
  #scp -P52222   /data/lpf/flume-sh/new-flume-maomao/hosts  $line:/etc/
  #ssh -p52222 $line 'source /etc/profile'
  echo $line
done
