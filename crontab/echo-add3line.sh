for ip_line in `cat ip.txt`
do
ssh -p59522 root@${ip_line}  << EOF
echo "
/opt/hadoop-s5qy3u/bin/hadoop fs -put /data/flumetaildir/wapdata/taildir/h5detail_staticpageshow.log.\\\${time1}* /user/hive/warehouse/minieastdaywap.db/log_miniwap_staticpageshow/dt=\\\${time2}/
/opt/hadoop-s5qy3u/bin/hadoop fs -put /data/flumetaildir/wapdata/taildir/h5detail_staticpageshow.log.\\\${time1}* /user/hive/warehouse/minieastdaywap.db/log_miniwap_staticpageshow/dt=\\\${time2}/
/opt/hadoop-s5qy3u/bin/hadoop fs -put /data/flumetaildir/wapdata/taildir/h5detail_staticpageshow.log.\\\${time1}* /user/hive/warehouse/minieastdaywap.db/log_miniwap_staticpageshow/dt=\\\${time2}/
 " >> /data/flumetaildir/h5detail_staticpageshow.sh
EOF
done
