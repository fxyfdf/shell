for ip_line in `cat ip.txt`
do
ssh -p59522 root@${ip_line}  << EOF
echo "
/opt/hadoop-5nxpdx/bin/hadoop fs -put \\\$localdir\\\$hdfsname1 \\\$hdfsdir1
count=\\\`/opt/hadoop-5nxpdx/bin/hadoop fs -ls \\\$hdfsdir1\\\$hdfsname1 |wc -l\\\`
if [[ \\\$count != 1 ]]
then
        echo -e \\"\\\$datenow\\\\t\\\$0\\\\tput\\\\terror\\" >> error.log
	/opt/hadoop-5nxpdx/bin/hadoop fs -put \\\$localdir\\\$hdfsname1 \\\$hdfsdir1
else    echo ok
fi
" >> /data/flumetaildir/apppic_pageshow.sh

EOF
done
