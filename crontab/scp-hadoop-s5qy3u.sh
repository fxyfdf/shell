for line in `cat ip.txt`
do
  rsync -az -e'ssh -p59522' /opt/hadoop-s5qy3u root@$line:/opt
  #scp -P59522 -r  /data/lpf/dftthadoop2  $line:/opt/
  ssh -p59522 $line 'chown hadoop:hadoop -R /opt/hadoop-s5qy3u'
  echo $line
done

