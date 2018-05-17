for line in `cat ip.txt`
do
  scp -P59522 -r  /data/lpf/dftthadoop2  $line:/opt/
  scp -P59522 -r  /data/lpf/hadoop-ecgdbr  $line:/opt/ 
  scp -P59522  -r /data/lpf/hadoop-tefam0  $line:/opt/
  ssh -p59522 $line 'chown hadoop:hadoop -R /opt/'
  echo $line
done
