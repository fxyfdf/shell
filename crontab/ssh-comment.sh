for line in `cat ip.txt`
do
#ssh -p59522 root@${line} "sed -i '/hadoop-s5qy3u/d' /data/flumetaildir/install02.sh"
#ssh -p59522 root@${line} "sed -i '/hadoop-s5qy3u/ s/10.9.189.8/${line}/g' /data/flumetaildir/act.sh"
#ssh -p59522 root@${line} "sed -i 's/log_adver_adunion_click_show_down_install/log_adver_adunion_click_show_down_install_source/g' /opt/elk/flume-1.7.0-5nxpdx/conf/repostadvs5.conf"
ssh -p59522 root@${line} "sed -i 's/hadoop-5nxpdx/hadoop-s5qy3u/g' /data/flumetaildir/apppic_pageshow.sh"
#ssh -p59522 root@${line} "\mv /opt/hadoop-s5qy3 /opt/hadoop-s5qy3u "
#ssh -p59522 root@${line} "touch /opt/elk/flume-1.7.0/conf/*.conf "
#ssh -p59522 root@${line} "touch /opt/elk/flume-1.7.0-ecgdbr/conf/*.conf "


done
