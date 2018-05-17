for line in `cat ip.txt`
do
  rsync -az -e'ssh -p59522' /opt/hadoop-5nxpdx root@$line:/opt
  #scp -P59522 -r  /data/lpf/dftthadoop2  $line:/opt/
  ssh -p59522 $line 'chown hadoop:hadoop -R /opt/hadoop-5nxpdx'
  echo $line
done

