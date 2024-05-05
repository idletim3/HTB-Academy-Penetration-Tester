# Tools
- [hydra](https://github.com/vanhauser-thc/thc-hydra)
- [medusa](http://foofus.net/?page_id=51)
- [ncrack](https://nmap.org/ncrack/)
- [patator](https://github.com/lanjelot/patator)
- [wfuzz](https://www.edge-security.com/wfuzz.php)

# Topics in the module
-   Brute forcing basic HTTP auth
-   Brute force for default passwords
-   Brute forcing login forms
-   Brute force usernames
-   Creating personalized username and password wordlists based on our target
-   Brute forcing service logins, such as FTP and SSH

Passwords are usually not stored in clear text on the systems but as hash values. Brute force involves generating hash values for various passwords until one matches the stored hash, as passwords can't be derived from their hash.

# Common files containing password hashes
| Windows  |  Linux  |
|----------|---------|
| [unattend.xml](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/update-windows-settings-and-scripts-create-your-own-answer-file-sxs?view=windows-11)  |  [shadow](https://www.man7.org/linux/man-pages/man5/shadow.5.html) |
| [sysprep.inf](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/sysprep--system-preparation--overview?view=windows-11)  |  shadow.bak |
| [SAM](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc756748(v=ws.10)) |  [passwd](https://man7.org/linux/man-pages/man5/passwd.5.html) |

# Basic HTTP Auth and Proxy Server Authentication/Authorization
[Full description.](https://datatracker.ietf.org/doc/html/rfc7617)

To receive authorization, the client

   1.  obtains the user-id and password from the user,

   2.  constructs the user-pass by concatenating the user-id, a single
       colon (":") character, and the password,

   3.  encodes the user-pass into an octet sequence (see below for a
       discussion of character encoding schemes),

   4.  and obtains the basic-credentials by encoding this octet sequence
       using Base64 ([RFC4648], Section 4) into a sequence of US-ASCII
       characters ([RFC0020]).

## Proxy Server Authentication
[Full description](https://datatracker.ietf.org/doc/html/rfc7615)

The HTTP Proxy-Authenticate response header defines the authentication method that should be used to gain access to a resource behind a proxy server. It authenticates the request to the proxy server, allowing it to transmit the request further. 

## Proxy Server Authorization
[Full description](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Proxy-Authorization)

The HTTP Proxy-Authorization request header contains the credentials to authenticate a user agent to a proxy server

## Password Attack Types
- Dictionary attack

  A simple list of potential passwords.
  
- Brute force

  Guessing every possible combination (aaaa ... ZZZZ).
  
- Traffic interception

  Traffic interception occurs when data is intercepted and monitored as it travels across networks.
  
- Man In the Middle

  A man-in-the-middle attack happens when communication between two parties is intercepted and potentially altered without their knowledge.

- Key Logging

  User input is logged.
  
- Social engineering

  Manipulating an individual or a group of individuals to obtain credentials.

## Default Passwords

Default passwords are easy to remember and (in theory) should be single use only. These often remain in place due to human errors (laziness), so they're always worth a check before exploring other avenues.

## Supported Hydra Modules
To get the current list: `hydra -h | grep "Supported services" | tr ":" "\n" | tr " " "\n" | column -e`

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/08f18e45-1ec3-45d5-b3f3-8282f8b339ed)

When attempting to bruteforce a login page, pay attention to the URL when entering randomly chosen credentials (i.e. admin:admin). A GET request will push the credentials into the URL while a POST will not. Whenever login forms are encountered, pay attention to the valid/invalid login/password messages and consider potential false positives/negatives. A good point is made in the module materials regarding what should and what should not be present following a login attempt.

## Tools for username generation
- [cupp](https://github.com/Mebus/cupp)
- Custom rules in [hashcat](https://hashcat.net/wiki/doku.php?id=rule_based_attack)/[john](https://github.com/openwall/john/blob/bleeding-jumbo/doc/RULES)
- [namebuster](https://github.com/benbusby/namebuster)
- [username-anarchy](https://github.com/urbanadventurer/username-anarchy)
