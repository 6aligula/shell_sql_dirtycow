```bash
nmap -A -v 10.0.2.15
```
resultado:
```bash
┌──(kali㉿kali)-[~]
──(kali㉿kali)-[~]
└─$ nmap -A -v 10.0.2.8 
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-03-21 11:35 EDT
NSE: Loaded 156 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 11:35
Completed NSE at 11:35, 0.00s elapsed
Initiating NSE at 11:35
Completed NSE at 11:35, 0.00s elapsed
Initiating NSE at 11:35
Completed NSE at 11:35, 0.00s elapsed
Initiating Ping Scan at 11:35
Scanning 10.0.2.8 [2 ports]
Completed Ping Scan at 11:35, 0.00s elapsed (1 total hosts)
Initiating Parallel DNS resolution of 1 host. at 11:35
Completed Parallel DNS resolution of 1 host. at 11:35, 16.51s elapsed
Initiating Connect Scan at 11:35
Scanning 10.0.2.8 [1000 ports]
Discovered open port 22/tcp on 10.0.2.8
Discovered open port 80/tcp on 10.0.2.8
Completed Connect Scan at 11:35, 0.37s elapsed (1000 total ports)
Initiating Service scan at 11:35
Scanning 2 services on 10.0.2.8
Completed Service scan at 11:35, 6.04s elapsed (2 services on 1 host)
NSE: Script scanning 10.0.2.8.
Initiating NSE at 11:35
Completed NSE at 11:35, 0.33s elapsed
Initiating NSE at 11:35
Completed NSE at 11:35, 0.01s elapsed
Initiating NSE at 11:35
Completed NSE at 11:35, 0.00s elapsed
Nmap scan report for 10.0.2.8
Host is up (0.0018s latency).
Not shown: 998 closed tcp ports (conn-refused)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 5.5p1 Debian 6+squeeze2 (protocol 2.0)
| ssh-hostkey: 
|   1024 5a:7b:cc:ca:58:11:11:2b:df:30:6a:4e:7e:05:28:92 (DSA)
|_  2048 54:cb:7d:9a:a9:90:01:02:e1:14:7e:9d:f9:46:85:51 (RSA)
80/tcp open  http    Apache httpd 2.2.16 ((Debian))
|_http-title: My Photoblog - last picture
|_http-server-header: Apache/2.2.16 (Debian)
| http-methods: 
|_  Supported Methods: GET HEAD POST OPTIONS
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 11:35
Completed NSE at 11:35, 0.00s elapsed
Initiating NSE at 11:35
Completed NSE at 11:35, 0.00s elapsed
Initiating NSE at 11:35
Completed NSE at 11:35, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 23.76 seconds

```


entro a la web:
![[Pasted image 20240321173807.png]]

