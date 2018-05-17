i=0
for line in `cat ip.txt`
do
  ssh -p59522 root@$line "cat /data/mycrawlerlogs/createhtmls.log | wc -l"
  echo $line
  i=$(($i+1))
  echo "-------------------$i-------------------" 
done

