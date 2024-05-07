# Basic Tools
## Question 1: Challenge your understanding of the Module content and answer the optional question(s) below. These are considered supplementary content and are not required to complete the Module. You can reveal the answer at any time to check your work. 

```
nc -nv [IP] [Port]
```

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/21af67be-0e99-4790-835c-a2613d41e38c)

Cross-checking the result.

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/ce807501-5637-45a1-8c9b-4180f7aca677)

# Serivce Scanning
## Question 1: Perform a Nmap scan of the target. What is the version of the service from the Nmap scan running on port 8080?

10.129.31.171 was added to /etc/hosts as 'academy.htb'.

```
nmap -sC -sV -A academy.htb
```

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/2060bff8-efb5-4383-8d2b-bfefaddb0a12)

## Question 2: Perform an Nmap scan of the target and identify the non-default port that the telnet service is running on. 

See above.

## Question 3: List the SMB shares available on the target host. Connect to the available share as the bob user. Once connected, access the folder called 'flag' and submit the contents of the flag.txt file. 

The credentials are given in the module.

```
smbclient -N -L \\\\[IP]\\ or smbmap -H academy.htb
smbclient -U [user] \\\\[IP]\\users
```

We can grab files "flag.txt" and "passwords.txt" from the SMB share. The FTP server also contains "passwords.txt."

# Web Enumeration
## Question 1: Try running some of the web enumeration techniques you learned in this section on the server above, and use the info you get to get the flag.

Checking for robots.txt:

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/6451781c-bde8-4b95-88c0-a33bb661b20c)

Upon closer inspection, we see credentials in the source code of the disallowed page.

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/e97a6837-15b1-46d7-ba86-eb871d0830a4)

Log in to obtain the flag.

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/cb497eff-3513-41ac-8021-a8de798ff7b6)

Directory search revealed WordPress in setup mode.

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/7118aa74-e415-4732-9a22-333f7dccbbca)

Whatweb output:

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/f49104dc-74ac-463b-9feb-3268831dcf0e)

Fuzzing for subdomains/vhosts didn't return anything.

# Public Exploits
## Question 1: Try to identify the services running on the server above, and then try to search to find public exploits to exploit them. Once you do, try to get the content of the '/flag.txt' file. (note: the web server may take a few seconds to start) 

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/bb7021d6-77a4-4842-bb00-8bdbf991d73a)

Quick google search reveals the version is vulnerable:

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/a80fa8e8-c65f-40d2-99b2-2d521db91747)

Searchsploit result:

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/d07411ab-f6a5-4b71-a66b-5bda22618ee5)

Using metasploit to obtain the contents of /etc/passwd, /var/www/html/wp-config.php:

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/93690f11-7e21-46e1-b360-d4c1920a9463)
![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/03d81ce5-8d94-473a-9a28-4e794f796a4e)

# Types of Shells

# Privilege Escalation

# Transfering Files

# Nibbles

# Problem Solving

# Knowledge Check
