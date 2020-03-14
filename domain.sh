
echo "[+] Findomain"
findomain -t $1 -o &>/dev/null
res=$(wc -l $1.txt)
echo "[*] Results: " $res

echo "[+] assetfinder"
assetfinder -subs-only $1 >>$1.txt
res=$(cat $1.txt|wc -l)
echo "[*] Results: " $res

echo "[+] subfinder"
subfinder -d $1 >>$1.txt
res=$(cat $1.txt|wc -l)
echo "[*] Results: " $res

echo "[+] amass"
amass enum -d $1 >>$1.txt
res=$(cat $1.txt|wc -l)
echo "[*] Results: " $res

echo "[+] crtsh"
curl -s https://crt.sh/?q=%.$1  | sed 's/<\/\?[^>]\+>//g'|sed 's~^    ~~'|grep $1|tail -n +3 >>$1.txt
res=$(wc -l $1.txt)
echo "[*] Results: " $res

echo "[+] unique_subdomains"
cat $1.txt|sort -u >allsubdomains.txt
res=$(cat allsubdomains.txt|wc -l)
echo "[*] Results: " $res
