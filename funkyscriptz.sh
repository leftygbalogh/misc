#!/bin/sh

#watch the files in the list and log events into logfile
inotifywait --monitor --quiet --format "%w%f %f %w %e" --outfile /home/ebalgza/inotify.log --fromfile /home/ebalgza/inotifyfile.list &

#stip out modified files from git status
git status | grep "modified: " | cut -d':' -f2 | xargs | tr ' ' '\n'
#space separated
git status | grep "modified: " | cut -d':' -f2 | xargs

#get the session number
export sessionID=$(who am i | cut -d'/' -f2 | cut -d' ' -f1)

#create filename based on session ID
nameFile="/var/lib/git-committer/nameSignumFile$sessionID"

#list all currently active ssh sessions
 date; last | grep "still"

#Create a directory for session specific data
mkdir /var/lib/git-committer

#Create a directory for app logs
mkdir /var/log/git-committer

#Initialise log file
touch "/var/log/git-committer/file-change-events-$(date +%Y%m%d).log"

#Enable recursive calls on startup script
chmod +x /etc/profile.d/credentials.sh

#create a folder if it does not exist
mkdir -p "/var/lib/git-committer/"

#Create file if it does not exist
[ -e "$nameFile" ] || touch "$nameFile"

#auto install dialog utility
yes | yum install dialog

#remove app without removing dependencies
rpm -e --nodeps "git"

#find two processes and exclude the grep process
ps -aux | grep [^]]watcher.sh || ps -aux | grep [^]]inotify

#send the output of multiple commands into a logfile
{
    echo "Current list of watched files is in: $filelist"
    cat $filelist
    last | grep "still" | sort
} >> $logfile

#kill maiadduser foo; spawn passwd foo; expect "password:"; send "abc123"; expect "Retype new password:"; send "abc123"; interact; usermod -aG wheel foo;n process and subprocess running in the background
killall inotifywait || killall watcher.sh

#Check multiple joint conditions A AND B
if [ $opened == "TRUE" ] &&  [ $modified == "TRUE" ] && [ $closed == "TRUE"  ]; then
        echo "$filename has been changed."
        echo "Time to call the ghost busters"
    fi

#echo in bold ad then set font back to regular
echo -e "\033[1mNAME\033[0m"

#send email from commandline
cat /tmp/contentsfile | mail -s "Test message subject" -c CCaddress@ericsson.com -r sender@vmx-eea375 -a /tmp/attachment.txt TOaddress@ericsson.com

#show attached device details such as drives and mounted devices
blkid -o list

#list processes with: groupID ID TTY_number
ps -g -o  "%r %p %y %x %c"

#get the process ID of a background process
ps -g -o  "%p %r %y %x %c" | grep "inotifywait" | cut -d ' ' -f1

#kill a process by ID based on its name
kill $( ps -g -o  "%p %r %y %x %c" | grep "inotifywait" | cut -d ' ' -f1 )

#Follow logs and highlight in green and red based on line contents
tail -f /opt/ericsson/eea/log/corr_0.log | awk '/blocking:false/ {print "\033[32m" $0 "\033[39m"}  /blocking:true/ {print "\033[31m" $0 "\033[39m"}'

#colorize log based on conditions
less /opt/ericsson/eea/log/corr_0.log | awk '  /blocking:false/ {print "\033[32m" $0 "\033[39m"}  /blocking:true/ {print "\033[31m" $0 "\033[39m"} /Report eventNum/ {print "\033[36m" $0 "\033[39m"} /Receive summary:/ {print "\033[37m" $0 "\033[39m"} /Memory/ {print "\033[38m" $0 "\033[39m"}'

#Log into each server and do something
for server in seliics01219 seliics01220 seliics01221; do echo $server; redis-cli -h $server -p 3000 keys '*'; done

#Set up sudo user with one line
U=youzerneim; P="pswrd"; adduser $U; echo $P | passwd $U --stdin; usermod -aG wheel $U; su - $U

#Look up IPs - various flavours
# Look up your own external IP
hostname -i
ifconfig | grep -v 127. | grep -v inet6 | grep inet

#look up incoming IP of your current SSH connection
echo $SSH_CONNECTION

#List all incoming connection IPs
netstat -taepn

#List all network connections with IPs ad ports
ss -lutan

#Look up IP of remote server by name
nslookup google.com
traceroute -I google.com

#check in file if user is authorized, does not allow partial match
username="ebalgza"; if [[ $(cat /tmp/authorized-users | grep -w $username | cut -d':' -f2) = "authorized" ]]; then echo "yes"; else echo "no"; fi

#Look up IP of a list of servers
 sed -i '/^$/d' /tmp/serverlistbyname;{ for server in $(cat /tmp/serverlistbyname); do nslookup $server | grep -v "#" | grep "Address:" |  cut -d' ' -f2 | tr -d '\n'; echo ":internal"; done; } > /tmp/network-IPs;  cat /tmp/network-IPs

#Remove lines from file that match a case-insensitive string
sed -i '/HIST*/ Id' /root/.bashrc;

#Change settings in the users .bashrc file
me=$(who am i | cut -d' ' -f1); sed -i '/HIST*/ Id' /$me/.bashrc; echo "HISTSIZE=5100" >> /$me/.bashrc; echo "HISTFILESIZE=312345" >> /$me/.bashrc; echo "HISTFILE=/var/log/somehistory" >> /$me/.bashrc;

#Set line start in bashrc
#http://bashrcgenerator.com/
export PS1="[\u@\h \w]\$ \[$(tput sgr0)\]"


#who is at the other end of the SSH connection
originatingIP=$(echo $SSH_CONNECTION | cut -d' ' -f1)
originatingServerName=$(nslookup $(echo $SSH_CONNECTION | cut -d' ' -f1) | grep "name = " | cut -d'=' -f2 | xargs)

#List processes based on keyword
ps -ef | grep cea

#Find if a package is installed
rpm -q eea
rpm -qa | grep "sqm"

#list IP tables rule with line numbers
iptables -L --line-numbers

#Delete ip tables rule by number
iptables -D INPUT 5

#Save IP tables
service iptables save / restart / stop / status

#scp without strick checking
alias scp='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

#ssh without sctict checking
alias ssh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

#Remove extension from filenames
rename -S .html .txt *.html

#Ping a specific port
IP="10.61.152.69" ; PORT="8102" ; curl -s "$IP:$PORT" > /dev/null && echo "Success connecting to $IP on port $PORT." || echo "Failed to connect to $IP on port $PORT."

#Find out if a particular package is available in yum
yum info policycore* | less

#Find out if a particular python package is available
pip list | grep "policy*"

#ssh config
vim ~/.ssh/config:
Host *
  ServerAliveInterval 600
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
  LogLevel=error
  GSSAPIAuthentication no

# Free space statusfree -g
free -g
grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}'

#sort files by size
ls -ltr -S

#list largest files
 du -hs ./*

#last reboot
last reboot | head -1
last -x|grep shutdown | head -1

#list contents of a tar file
tar -ztvf my-data.tar.gz

# Create a screen session with a nameFile
screen -S foo

#Rename an existing screen session
CTRL-a :sessionname FOO

#Listing all services
chkconfig --list

#Collect your selected history into a remote file from several sources
history | grep -v 'ls' | grep -v 'ping' | grep -v 'ssh' | grep -v 'pwd' | ssh root@vmx-eea231 "cat >> /home/ebalgza/Documents/history20170728"

#Crete a list of running processes before and after and list the differences
#before
touch /tmp/before-process-list; echo "PROCESSES" > /tmp/before-process-list; ps -eo user,cmd --sort  user| cut -c-120 >> /tmp/before-process-list; echo "SERVICES" >> /tmp/before-process-list; service --status-all >> /tmp/before-process-list; less /tmp/before-process-list
#after
clear; echo "hold it"; touch /tmp/after-process-list; echo "PROCESSES" > /tmp/after-process-list; ps -eo user,cmd --sort  user| cut -c-120 >> /tmp/after-process-list; echo "SERVICES" >> /tmp/after-process-list; service --status-all >> /tmp/after-process-list;

#Compare two files and remove the common lines
awk 'NR==FNR{a[$0]=1;next}!a[$0]' /tmp/after-process-list /tmp/before-process-list | grep -E "sd|oracle"

#Update and start time on CentOS 6.5
chkconfig | grep ntp; service ntpd status; chkconfig ntpd on; ntpdate 10.64.2.226; service ntpd start;

#figure our why you cant log in as root into a remote console
less /var/log/secure
missing pam.limit file
vim /etc/pam.d/login
comment out that line that requires it

# Add search param if missing
if [ `grep -q 'search' /etc/resolv.conf; echo $?` -eq 1 ];then echo "nincs"; `echo 'search sson.se' >> /etc/resolv.conf`; fi;

#Turn off firewall on RHEL 6.5
service iptables save
service iptables stop
chkconfig iptables off

#Expect script to check major RedHat version on multiple remote hosts
    #!/usr/bin/expect
    log_user 0
    spawn ssh -l root [lindex $argv 0]
    expect "assword:"
    send "sUp3rS3cr3tP4ssW0rd^\r"
    expect "# "
    log_user 1
    send "cat /etc/redhat-release\r"
    expect "*#"
    log_user 0
    send "exit\n"

[root@home ~]
    for server in server1 server2 server3 server4 server5; do echo -e "$server: \c"; /root/server-version.sh $server; echo; echo; done;

#Output
    server1: cat /etc/redhat-release
    Red Hat Enterprise Linux Server release 7.3 (Maipo)
    [root@server1 ~]#

    server2: cat /etc/redhat-release
    Red Hat Enterprise Linux Server release 7.3 (Maipo)
    [root@server2 ~]#

#Compile C code with gcc then run it
gcc program-source-code.c -o executable-file-name
./executable-file-name

#Get the list of logical volume names
lsblk | grep vg01 | cut -c 3- | cut -d ' ' -f 1

var="$(lsblk | grep vg01 | cut -c 3- | cut -d ' ' -f 1)"; echo $var; if [ -z "$var" ]; then echo "no such volume";else echo "volume exits"; fi

#Capture TCP dump for 10 seconds
tcpdump -w /tmp/tcpdump.log -i eno1 -G 10 -W 1 &

tail -f /tmp/tcpdump.log | awk '/X-Manager-Host/ {print "\033[32m" $0 "\033[39m"}  /sels01713/ {print "\033[31m" $0 "\033[39m"}'

kill $(ps -ef | grep tcp | cut -d ' ' -f3)


#List the ten largest space
du -sh * | sort -hr | head -n10

#List all disks, mounted and unmounted
lsblk --output NAME,UUID,FSTYPE,LABEL

#Screen -dRR
/home/ebalgza>screen -dRR cl6

# count the number of lines in a non-linebreak output
./leftypsutil.py | grep -o '\\n'| wc -l

#grep for lines After match (-B before; -C context)
grep -A 1 -r "<name>directorywindowsize</name>" /mapr/MT2/user/root/ark_apps/

find anything
grep -iRL "what ya want to find" ./### Operator Environment Specifics ###

#Configure an interface to an IP with a netmask
ifconfig ens224 up 192.168.0. netmask 255.255.252.0; ifconfig -a | grep ens224 -A 1

#Mount cea-proj
vim /etc/fstab
server.com:/teproj/proj110072/cea-proj /mnt/cea-proj   nfs rw,soft,bg,nfsvers=3    0 0
mkdir -p /mnt/cea-proj
service rpcbind start
mount -a
ll /mnt/cea-proj/

#Disable firewall on RHEL 6.5
service iptables save
service iptables stop
chkconfig iptables off

#Find dead docker containers
docker ps -a | grep -e "no" -e "dead" -e "exited"

#remove password auth from ssh
ssh-keygen -t rsa -C 'geza.balogh@mail.com'
ssh-copy-id root@selcs01691

#grep on everything that does not match
cat /opt/sson/eea/log/pag_gpeh_gpeh_avro_0.log | grep -avE 'Pag replay thread|Pag replay thread|Pag Set compressio|Pag sending replay|Pag stopped replay|Pag deleted replay|Pag got control re|Pag got control re|Pag stopping repla|Pag finished read|Pag start replay|reading historic events|from|stopping replay thread|000000'
