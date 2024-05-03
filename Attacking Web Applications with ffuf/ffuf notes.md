# Cheat Sheet
`fuff -h` for help. More information and examples at: https://github.com/ffuf/ffuf
## Sub-domain Fuzzing
```
ffuf -w [wordlist]:FUZZ -u http://FUZZ.[IP]/
```
## Virtual Host Fuzzing
```
ffuf -w [wordlist]:FUZZ -u http://FUZZ.[IP]:[PORT]/
```
The key difference between a virtual host and a sub-domain is that the virtual host is served on the same server (IP). A single IP could serve multiple websites. Remember to add the IP to `/etc/hosts`, and add the HTTP headers option `(-H 'Host: ...')` to the command.
## Directory Fuzzing
```
ffuf -w [wordlist]:FUZZ -u http://[IP]:[PORT]/FUZZ -v -c
```
## Extension Fuzzing
```
ffuf -w [wordlist]:FUZZ -u http://[IP]:[PORT]/[filename]FUZZ -v -c
```
A typical filename that's a good start is "index" as it's commonly found on websites regardless of the technologies in use.
## Page Fuzzing
```
ffuf -w [wordlist]:FUZZ -u http://[IP]:[PORT]/[directory]/FUZZ.[extension] -v -c
```
## Recursive Fuzzing
```
ffuf -w [wordlist]:FUZZ -u http://[IP]:[PORT]/FUZZ -recursion -recusion-depth [integer] -e [extension(s)] -v -c
```
Increasing the recusion depth significantly increases the time required to complete the task.

## Parameter Fuzzing
GET: `ffuf -w [wordlist]:FUZZ -u http://[IP]:[PORT]/[directory]/[filename].[extension]?FUZZ=key`

POST: `ffuf -w [wordlist]:FUZZ - -u http://[IP]:[PORT]/[directory]/[filename].[extension] -X POST -d 'FUZZ=key' -H 'Content-Type: [content type]'`

A full list of content types can be found at: https://www.iana.org/assignments/media-types/media-types.xhtml

The most common types: https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types
