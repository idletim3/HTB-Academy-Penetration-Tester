# Basic Tools - Question 1: Challenge your understanding of the Module content and answer the optional question(s) below. These are considered supplementary content and are not required to complete the Module. You can reveal the answer at any time to check your work.

The service running on port 39938 was SSH-2.0-OpenSSH_8.2p1 Ubuntu-4ubuntu0.1.

Mitigation methods:
1. Display false or no information.
2. Disable vendor and version information whenever possible.
3. Disable any unnecessary services on the host/network.
4. Change and/or hide file extensions whenever possible/applicable.
5. Implement firewall rules to prevent snooping.

# Serivce Scanning - Question 3: List the SMB shares available on the target host. Connect to the available share as the bob user. Once connected, access the folder called 'flag' and submit the contents of the flag.txt file.

Mitigation methods:
1. Enforce strict password policies.
2. Periodically audit files included in the SMB shares.
3. Restrict access following the principle of least privilege.
   Disable null sessions using [Network access: Restrict anonymous access to Named Pipes and Shares to Enabled](https://learn.microsoft.com/en-us/archive/msdn-technet-forums/52899d34-0033-41f5-b5e0-2325dd827244) registry 

# Web Enumeration - Question 1: Try running some of the web enumeration techniques you learned in this section on the server above, and use the info you get to get the flag.

1. Enforce strict password policies.
2. Do not push default and test credentials into production.
3. Verify that comments and code do not contain any sensitive information.
5. Periodically audit the service.

# Public Exploits - Question 1: Try to identify the services running on the server above, and then try to search to find public exploits to exploit them. Once you do, try to get the content of the '/flag.txt' file. (note: the web server may take a few seconds to start)

1. Do not disclose version information.
2. Update/patch software frequently.
3. Internal/external penetration testing.

# Nibbles
