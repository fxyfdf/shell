
for line in `cat ip.txt`
do
ssh -p52222 root@$line  << EOF 
echo "
10.9.145.189	uhadoop-s5qy3u-master1
10.9.129.212	uhadoop-s5qy3u-master2
10.9.162.14	uhadoop-s5qy3u-core1
10.9.48.145	uhadoop-s5qy3u-core3
10.9.12.134	uhadoop-s5qy3u-core4
10.9.74.115	uhadoop-s5qy3u-core5
10.9.173.252	uhadoop-s5qy3u-core6
10.9.55.61	uhadoop-s5qy3u-core7
10.9.99.19	uhadoop-s5qy3u-core8
10.9.138.193	uhadoop-s5qy3u-core9
10.9.53.62	uhadoop-s5qy3u-core10
10.9.85.32	uhadoop-s5qy3u-core11
10.9.80.28	uhadoop-s5qy3u-core12
10.9.185.90	uhadoop-s5qy3u-core13
10.9.140.209	uhadoop-s5qy3u-core14
10.9.106.13	uhadoop-s5qy3u-core15
10.9.83.224	uhadoop-s5qy3u-core16
10.9.96.160	uhadoop-s5qy3u-core17
10.9.34.63	uhadoop-s5qy3u-core18
10.9.29.91	uhadoop-s5qy3u-core19
10.9.48.125	uhadoop-s5qy3u-core20
10.9.134.195	uhadoop-s5qy3u-core21
10.9.69.17	uhadoop-s5qy3u-core22
10.9.104.180	uhadoop-s5qy3u-core23
10.9.61.188	uhadoop-s5qy3u-core24
10.9.174.160	uhadoop-s5qy3u-core25
10.9.186.23	uhadoop-s5qy3u-core26
10.9.177.52	uhadoop-s5qy3u-core27
10.9.98.39	uhadoop-s5qy3u-core28
10.9.146.217	uhadoop-s5qy3u-core29
10.9.72.20	uhadoop-s5qy3u-core30
10.9.160.39	uhadoop-s5qy3u-core31
">>/etc/hosts
EOF
done
