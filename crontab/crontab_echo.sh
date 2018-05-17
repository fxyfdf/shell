#echo_line='echo "/opt/hadoop-ecgdbr/bin/hadoop fs -put /data/flumetaildir/wapdata/taildir/show.log.\${time1}* /user/hive/warehouse/minieastdaywap.db/log_adver_show/dt=\${time2}/" >> /data/flumetaildir/aa'
echo_line="su - hadoop -c 'sh /data/filetohdfs.sh &' "
for line in `cat ip.txt`

do
  #ssh -p59522 root@$line  "cp /data/wapdata/backup/active.log.2018-01-31.log  /data/wapdata/active/"
  #ssh -p59522 root@$line $echo_line
  #ssh -p59522 root@$line  "rm -f /data/wapdata/active/active.log.2018-01-31.log "

  echo $line

done
