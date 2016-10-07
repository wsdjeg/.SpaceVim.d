#### create config file `~/.getmail/getmailrc_outlook`

```
[retriever]
type = SimplePOP3SSLRetriever
server = pop-mail.outlook.com
username = wsdjeg@outlook.com
password = password
port = 995

[destination]
type = Maildir
path = ~/.Mail/inbox/outlook/

[options]
verbose = 0
delete = false
message_log = ~/.getmail/getmail.log
```
