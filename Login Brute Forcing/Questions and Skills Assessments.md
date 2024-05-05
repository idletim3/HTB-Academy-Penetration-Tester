# Question 1: Using the technique you learned in this section, try attacking the IP shown above. What are the credentials used?

Upon accessing the website IP:PORT we get a pop up. A simple http-get bruteforce as shown in the module is sufficient to get in. Alternatively, you could (and should) try some of the default credentials.
![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/ec8112eb-3a79-4ca8-b3a7-08d81c9ef6bb)

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/05c13e0d-c92f-4328-a901-c58deb76e708)

Upon entering the credentials obtained using hydra:

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/74317d20-dd44-49b1-a9a9-b14a6f891d1d)

Notice the authorization header (value erased).

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/2cd4f68e-ce8c-4ed4-8359-b70ff1155393)

# Question 2: Try running the same exercise on the question from the previous section, to learn how to brute force for users.

Swap the username to an unknown (i.e. use a wordlist, -L), while keeping the password known (-p).

# Question 3: Using what you learned in this section, try attacking the '/login.php' page to identify the password for the 'admin' user. Once you login, you should find a flag. Submit the flag as the answer. 

Notice that the method has changed from GET to POST. This needs to be accounted if you're using hydra.

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/d2fe63bc-8401-471f-bee8-c2c2de7c388e)

The command required takes the following form:
```
hydra -l [username] -P [password wordlist] [IP] -s [PORT] [Request type] "<url>:<form parameters>[:<optional>[:<optional>]:<condition string>"
hydra -l [redacted] -P [redacted] 94.237.49.166 -s 45313 http-post-form "/login.php:username=^USER^&password=^PASS^:F=<form name='login'"
```

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/78b91f7a-31af-4ef8-af36-9b7e1fa21fc4)

# Question 4: Using what you learned in this section, try to brute force the SSH login of the user "b.gates" in the target server shown above. Then try to SSH into the server. You should find a flag in the home dir. What is the content of the flag?

The login name is given in the module. Generate a password list following the steps from the "Personalized Wordlists" section.
```
hydra -l b.gates -P william.txt ssh://83.136.254.223:54150 -t 4
```
![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/307e945d-43f0-4158-8342-4ed7f1eebd67)

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/f50a409a-b1fe-460d-9cba-ff05e22fb04f)

# Question 5: Once you ssh in, try brute forcing the FTP login for the other user. You should find another flag in their home directory. What is the flag?

Confirming the FTP service is running on the machine and obtaining its port: `netstat -antp | grep -i list`

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/723bcbdd-ae8c-4500-9bb5-988ae3e99328)

Using the discovered information to bruteforce the FTP login for the other user: `hydra -l m.gates -P rockyou-10.txt ftp://127.0.0.1`

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/eddc7f6c-718f-4d02-9bb3-a9a53a26be5b)
