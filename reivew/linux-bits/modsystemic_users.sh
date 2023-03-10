
From last year.


root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
uucp:x:10:14:uucp:/var/spool/uucp:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
gopher:x:13:30:gopher:/var/gopher:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:99:99:Nobody:/:/sbin/nologin
vcsa:x:69:69:virtual console memory owner:/dev:/sbin/nologin
rpc:x:32:32:Rpcbind Daemon:/var/cache/rpcbind:/sbin/nologin
rpcuser:x:29:29:RPC Service User:/var/lib/nfs:/sbin/nologin
nfsnobody:x:65534:65534:Anonymous NFS User:/var/lib/nfs:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
ntp:x:38:38::/etc/ntp:/sbin/nologin
haldaemon:x:68:68:HAL daemon:/:/sbin/nologin
admin:x:503:503::/home/admin:/bin/bash
ftpuser:x:504:504::/home/ftpuser:/bin/bash
kjames:x:506:506::/home/kjames:/bin/bash
test:x:507:507::/home/test:/bin/bash
devteam:x:508:508::/home/devteam:/bin/bash
hmars:x:509:509::/home/hmars:/bin/bash
apache:x:48:48:Apache:/var/www:/sbin/nologin
saslauth:x:499:76:Saslauthd user:/var/empty/saslauth:/sbin/nologin
postfix:x:89:89::/var/spool/postfix:/sbin/nologin
joshua:x:510:510::/home/joshua/:/bin/bash
netmon:x:511:511::/home/netmon/:/bin/bash
secmon:x:512:512::/home/secmon/:/bin/bash
edward:x:513:513::/home/edward/:/bin/bash
user:x:514:514::/home/user/:/bin/bash
hmcdonald:x:515:515::/home/test/:/bin/bash
eparsons:x:516:516::/home/eparsons/:/bin/bash
it:x:517:517::/home/it/:/bin/bash
shareuser:x:518:518::/home/shareuser:/sbin/nologin
temp:x:519:519::/home/temp:/sbin/nologin


for user in $(cat );do


# /etc/shadow
root:$6$/KkgfOAT$b4v6TMU2oA8UYN4bnTqiKvkQBjQLi2swFjbI0xQLw8N7d3jfkc/RXkUkCECmhKJrTOQKvIRBg4yr6k94CG68Z.:17941:0:99999:7:::
bin:*:14924:0:99999:7:::
daemon:*:14924:0:99999:7:::
adm:*:14924:0:99999:7:::
lp:*:14924:0:99999:7:::
sync:*:14924:0:99999:7:::
shutdown:*:14924:0:99999:7:::
halt:*:14924:0:99999:7:::
mail:*:14924:0:99999:7:::
uucp:*:14924:0:99999:7:::
operator:*:14924:0:99999:7:::
games:*:14924:0:99999:7:::
gopher:*:14924:0:99999:7:::
ftp:*:14924:0:99999:7:::
nobody:*:14924:0:99999:7:::
vcsa:!!:17582::::::
rpc:!!:17582:0:99999:7:::
rpcuser:!!:17582::::::
nfsnobody:!!:17582::::::
sshd:!!:17582::::::
dbus:!!:17582::::::
ntp:!!:17582::::::
haldaemon:!!:17582::::::
admin:$6$HCavglg8$MBOM44LWaiWxYrDzsM7GMEDUOA1yohCc4A8miqso5/tJlCTSk7cjni.2l.PzrlD8CDUs2PrvvRsS96N5MCx8y.:17957:0:99999:7:::
ftpuser:$6$nlaHFiCT$9L5ZVl2jSdAtXgI/Zwv.c/te2TguB0SgqqxuJDH48lDL6A0E1f9TIMl0THcSqEpz8gThH/RMigyv0M.nPIsDg.:17957:0:99999:7:::
kjames:$6$pC3aRY.w$nR9u4Yfa7MUS0.F6FiAATGqbIVgxAVJ76Q.C8k.MMWW70xfmxvGLAGVbUF7/pZQ6yNd5nv6wlXdzQj9eqSNxW.:18294:0:99999:7:::
test:$6$D08niyX7$FtV4oK2ywyNTVkN4K7iIqltynn46vbgEl3Ty1URlygRf3r.7RVoDNDxDh7fo79W1GUGe/p5LX45EDw3OUODvA.:17957:0:99999:7:::
devteam:$6$mYemPPmu$sB0DjRSRR.Zf9sG1ftV6vWmeSMwyeIuBUpKUj42NPIIIFVlmOPe3RdZkIM2Bf9B9UtP9ntj9aPd2XIzL7LD/h1:17957:0:99999:7:::
hmars:$6$ukoq9MTT$c1eNH/uniXSc0gq2urk1rq0mnSAWksAQuBNgZgu6lyEmdj3bDoxs9I5kXhFN.0X7dWw3C00ano2i09s/4PePg0:17957:0:99999:7:::
apache:!!:17947::::::
saslauth:!!:17947::::::
postfix:!!:17947::::::
joshua:$6$OpAs2.FP$datybNx.vfmYmqVotnoJfk0Sr6VLlASqhoVF6uEKX1oFpV6rh4pfMuDLW2Nr38tuWSp4EsYYXTr8.bkdsgekq0:18294:0:99999:7:::
netmon:$6$9Q4mg2P2$kcKHtPtrRSgZhp7WNfBR8aXfWwWqpoYmgaQK4fcLUXdTfyimvDGc2lyk4gVrOHirGDw.hV3iPs1AtW.VY2s3v1:17957:0:99999:7:::
secmon:$6$HKpG48Rv$/gaYQyQPhfRUocnXMFI4BDcXg0xWbKprWkzu6DyHAj04Fd5p28/lNCXQXgntoXP1HrIGqqNzmXjgnm5O7IYTy1:17957:0:99999:7:::
edward:$6$IukhTo90$BTIpU8tAKIs74I19PAeJ.D.xkbNoku/unsydCBUa30/Vo43CKPhaOnnxCWZbsadzNYYM09E3nMd74oMgPFk7n0:17957:0:99999:7:::
user:$6$BUa3n4hd$0g9OSPoBSrGqU4dZH.hmlSubvYSBIekqWxSjDZlBOhdnfY1LHWyv8baHVj.QBBLaH0cm8k70AwWmFadhp.FlE0:17957:0:99999:7:::
hmcdonald:!!:17957:0:99999:7:::
eparsons:$6$hQstFTGo$JwrVibLYHe7WwfnXTABeBjoi1i2J.Wim5D37MtcxbIDcAK8zynusWQAsmew/5nCDsgDubM.l1xWPlIGJ2vXOW1:17957:0:99999:7:::
it:$6$prOEoqhl$4HXUJoV9996.1xJTq3lxOGNTc16Vggbxo24ewNRDdTYAkd24W7V6xBQD4AveiMSPZyiqdK7lQThdy6DZ2i5Tr1:17957:0:99999:7:::
shareuser:!!:17957:0:99999:7:::
temp:!!:18294:0:99999:7:::


usermod -s /bin/nologin eparsons
usermod -s /bin/nologin administrator
usermod -s /bin/nologin joshua
usermod -s /bin/nologin kjames
usermod -s /bin/nologin netmon
usermod -s /bin/nologin secmon
usermod -s /bin/nologin devteam