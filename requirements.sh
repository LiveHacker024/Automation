
#!/bin/bash

echo "[+] Updating system..."
sudo apt update -y

echo "[+] Installing base tools..."
sudo apt install -y \
nmap \
gobuster \
nikto \
sqlmap \
wpscan \
curl \
git \
unzip

echo "[+] Installing Go (if not installed)..."
if ! command -v go &> /dev/null; then
    sudo apt install golang -y
fi

echo "[+] Installing Go tools..."

# command 
chmod +x requirements.sh
./requirements.sh

# httpx
go install github.com/projectdiscovery/httpx/cmd/httpx@latest

# nuclei
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest

# waybackurls
go install github.com/tomnomnom/waybackurls@latest

echo "[+] Adding Go bin to PATH..."

if ! grep -q "go/bin" ~/.bashrc; then
    echo 'export PATH=$HOME/go/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
fi

echo "[+] Updating Nuclei templates..."
$HOME/go/bin/nuclei -update-templates

echo "[+] Installation Completed!"

echo "[+] Verify tools:"
echo "--------------------------------"
which nmap
which gobuster
which nikto
which sqlmap
which wpscan
which curl
which httpx
which nuclei
which waybackurls
echo "--------------------------------"

echo "[+] Done! Now run your tool:"
echo "chmod +x attack_engine_v5.sh"
echo "sudo ./attack_engine_v5.sh example.com"
