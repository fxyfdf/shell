
for crontab_name in `cat crontab_name.txt`
do
for line in `cat ip.txt`
do
  sed -i "2c ip=${line}" ${crontab_name}
  #sed -i "s/10.9.101.233/$line/g"  filetohdfs.sh-$line
  cp ${crontab_name} ${crontab_name}.$line
  scp -P59522 ${crontab_name} $line:/data/flumetaildir/${crontab_name}
  ssh -p59522 root@$line "chown hadoop:hadoop /data/flumetaildir/${crontab_name} && chmod 755 /data/flumetaildir/${crontab_name}"
  echo $line
done
done
