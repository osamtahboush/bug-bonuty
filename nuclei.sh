nuclei -u http://challenge01.root-me.org   

nuclei -u http://challenge01.root-me.org    -t http/cves -severity critical -jsonl


nuclei -u https://target.com -t ~/nuclei-templates/http/cves/2026/CVE-2026-3326.yaml

nuclei -u https://api.target.com -tags http/exposures/apis


nuclei -u http://challenge01.root-me.org \
  -severity critical,high,medium,low,info \
  -templates http/cves,http/misconfiguration,http/exposures \
  -rate-limit 300 \
  -c 50 \
  -jsonl -o full_scan.jsonl


#---------proxy

nuclei -u http://challenge01.root-me.org \
  -t http/cves \
  -rl 500 \
  -bulk-size 100 \
  -proxy http://127.0.0.1:8080 \
  -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)" \
  -timeout 5 -retries 1


nuclei -u http://challenge01.root-me.org -tags tech,exposure,config

# مع دمج مع httpx لالتقاط الـ Hosts الحية أولاً
cat domains.txt | httpx -silent -title -tech-detect -status-code | nuclei -t http/

