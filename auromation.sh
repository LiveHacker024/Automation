#!/bin/bash

TARGET=$1
OUTPUT="scan_$TARGET"
THREADS=10

if [ -z "$TARGET" ]; then
    echo "Usage: ./full_auto_scan.sh <target>"
    exit 1
fi

mkdir -p $OUTPUT/{recon,scan,vuln,report}

echo "[+] Target: $TARGET"

# ==============================
# 🔍 RECON
# ==============================
echo "[+] Running Subdomain Enumeration..."

subfinder -d $TARGET -all -recursive -t 50 -silent | tee $OUTPUT/recon/subs.txt
amass enum -passive -d $TARGET | tee -a $OUTPUT/recon/subs.txt

sort -u $OUTPUT/recon/subs.txt | tee $OUTPUT/recon/all_subs.txt

echo "[+] Checking Live Hosts..."
httpx -l $OUTPUT/recon/all_subs.txt \
-threads 50 -status-code -title -tech-detect -silent \
| tee $OUTPUT/recon/live.txt

# ==============================
# 🌐 URL COLLECTION
# ==============================
echo "[+] Collecting URLs..."
waybackurls $TARGET | tee $OUTPUT/recon/urls.txt

grep -E "id=|page=|cat=|user=|file=" $OUTPUT/recon/urls.txt \
| tee $OUTPUT/recon/params.txt

# ==============================
# 🔎 NMAP
# ==============================
echo "[+] Running Nmap..."
nmap -p- -T4 -A -v --min-rate=1000 --max-retries=2 \
--open -iL $OUTPUT/recon/live.txt \
| tee $OUTPUT/scan/nmap.txt

Type  :qa  and press <Enter> to exit Vim                                                                                                                                                                                  16,32         Top
