#!/bin/bash

## source: https://www.quora.com/Bash-shell-What-are-the-best-bashrc-pranks

Step one:
Change their prompt.

    # put this in their .bashrc
    export PS1="Login: "



Step two: 
Add an alias for their username, and for any other account names they might try logging in as, for example, 'root'.

    # put these in their .bashrc too:
    alias joe='stty -echo; echo -n "Password: ";read;echo;echo "Login failed.";stty echo'
    alias root='stty -echo; echo -n "Password: ";read;echo;echo "Login failed.";stty echo'



Step three:
Try not to laugh your head off, as they struggle.

    Login: joe
    Password: ...

Related Questions
More Answers Below

    What are some useful .bash_profile and .bashrc tips?
    What is a good song for lyric prank?
    Shell (computing): What are some funny Bash aliases?
    What is unique or interesting about your .bashrc file?
    What are some good songs to make a texting lyric prank?

Ben Newman
Ben Newman, JavaScript whisperer
Updated Jun 9, 2013 · Author has 169 answers and 718.9k answer views
Originally Answered: What are the best bashrc pranks?
Mac OS X comes with a command line utility called say that's sort of like echo, but instead it speaks its arguments audibly.

You have to alter some spellings sometimes to get the phonemes to sound just right, but the default inflections are surprisingly good.

Example prank:

    alias sudo="say Ime sorry Dave. Ime afraid I can\'t: "



Or, to be a little more personal:

    alias sudo="say Ime sorry $USER. Ime afraid I can\'t: "

16k views · View 142 Upvoters

sponsored by DatadogHQ.com
Monitor your entire Docker cluster in real time.
Get deep insights into your containers' health, resource usage, and deployment with Datadog. Free trial.
Sign Up
Baptiste Fontaine
Baptiste Fontaine, daily Bash user.
Answered Oct 27, 2013 · Author has 361 answers and 967.7k answer views
Originally Answered: What are the best bashrc pranks?
Here is a nasty one involving a bit of randomness:

Add the following line at the end of the .bashrc:

    trap '[ "$RANDOM" -le 2000 ] && exit' DEBUG



Then, each time the user types a command, Bash will generate a random number between 0 and 32767, and exit if this number is below 2000. You may want to change the threshold to adjust the probability of a crash.
6k views · View 32 Upvoters
Jared Spiegel
Jared Spiegel, https://github.com/jrrs/sh/
Answered Jun 4, 2016

while not directly on topic, i’ll share my personal best rc-file prank.

.ssh/config

    host *
    	escapechar .

this will go unnoticed until someone tries to begin a command with ‘.’, such as like, “../bin/whatever”.

since the default escape command assigned to ‘.’ itself is ‘Disconnect.’, the first ‘.’ entered by the user (if it’s the first thing they type on a new connection, or thereafter any time it’s immediately after a newline) enters escape mode, and the second one issues a disconnect from the remote host.

you can add the ‘host *’ clause anywhere in the file, it doesn’t have to be at the top or bottom specifically, and i believe multiple ‘host *’ clauses are legal and parsed.
