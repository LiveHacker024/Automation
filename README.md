# 💀 Full Auto Pentest Tool

> ⚡ One Command → Full Recon & Vulnerability Scan

An advanced automated penetration testing framework built for **security researchers, students, and bug bounty hunters**.
This tool performs **reconnaissance, scanning, and vulnerability detection** using multiple industry-standard tools in a single workflow.

---

## 🚀 Features

* 🔍 Subdomain Enumeration (Subfinder, Amass)
* 🌐 Live Host Detection (HTTPX)
* 📡 Advanced Port Scanning (Nmap)
* 📂 Directory Bruteforce (Gobuster)
* 🛡️ Web Vulnerability Scan (Nikto)
* ⚡ Fast Vulnerability Detection (Nuclei)
* 💉 SQL Injection Testing (SQLMap - WAF Bypass)
* 🔥 Command Injection Testing (Commix)
* 📊 Clean Report Generation
* ⚙️ Multi-threaded Scanning

---

## 🧰 Required Tools

Make sure these tools are installed:

* nmap
* sqlmap
* nikto
* gobuster
* dirb
* commix
* subfinder
* amass
* httpx
* nuclei
* waybackurls

---

## ⚙️ Installation (Kali Linux)

### 1️⃣ Install system tools

```bash
sudo apt update
sudo apt install nmap sqlmap nikto gobuster dirb -y
```

### 2️⃣ Install Go (required)

```bash
sudo apt install golang -y
```

### 3️⃣ Install Go-based tools

```bash
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/owasp-amass/amass/v4/...@master
go install github.com/tomnomnom/waybackurls@latest
```

### 4️⃣ Fix PATH

```bash
export PATH=$PATH:$HOME/go/bin
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### 5️⃣ Update Nuclei Templates

```bash
nuclei -update-templates
```

---

## ▶️ Usage

```bash
chmod +x full_auto_scan.sh
./full_auto_scan.sh target.com
```

### Example:

```bash
./full_auto_scan.sh testphp.vulnweb.com
```

---

## 📂 Output Structure

```
scan_target.com/
 ├── recon/
 ├── scan/
 ├── vuln/
 └── report/
     └── final_report.txt
```

---

## 📊 Output

* 🔍 Recon data (subdomains, URLs)
* 🌐 Live hosts
* 📡 Open ports/services
* 💉 SQL Injection results
* ⚡ Vulnerability findings
* 📄 Final clean report

---

## ⚠️ Disclaimer

This tool is created for **educational and authorized penetration testing only**.
Do not use this tool on any system without proper permission.

---

## 👨‍💻 Author

**Kunal**

---

## ⭐ Support

If you like this project, give it a ⭐ on GitHub!


