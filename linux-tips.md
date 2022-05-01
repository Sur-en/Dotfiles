# Security

* `root# faillock --user myUsername --reset` - resotre user after typing wrong
password
* `vim /etc/security/faillock.conf` - open this file and change `deny` field
to change count of wrong password after which Linux will lock user
