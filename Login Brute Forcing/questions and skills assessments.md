# Question 1: Using the technique you learned in this section, try attacking the IP shown above. What are the credentials used?

Upon accessing the website IP:PORT we get a pop up. A simple http-get bruteforce as shown in the module is sufficient to get in.
![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/ec8112eb-3a79-4ca8-b3a7-08d81c9ef6bb)

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/05c13e0d-c92f-4328-a901-c58deb76e708)

Upon entering the credentials obtained using hydra:

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/74317d20-dd44-49b1-a9a9-b14a6f891d1d)

Note: The base64 authorization string was erased.

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/2cd4f68e-ce8c-4ed4-8359-b70ff1155393)

The login form can then again be bruteforced using a tool of your choice. Notice that the method has changed from GET to POST. This needs to be accounted if you're using hydra.

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/d2fe63bc-8401-471f-bee8-c2c2de7c388e)

The command required takes the following form:
```
hydra -l [username] -P [password wordlist] [IP] -s [PORT] [Request type] "[Request]:[username field name]=^USER^&[password field name]=^PASS^:F=[Bad password error message]"
hydra -l [redacted] -P [redacted] 94.237.49.166 -s 45313 http-post-form "/login.php:username=^USER^&password=^PASS^:F=<form name='login'"
```

![image](https://github.com/idletim3/htb-academy-penetration-tester/assets/128943623/78b91f7a-31af-4ef8-af36-9b7e1fa21fc4)
