#!/bin/bash

## Source: https://unix.stackexchange.com/questions/232/unix-linux-pranks



Install "sl". Choo choo! http://www.tkl.iis.u-tokyo.ac.jp/~toyoda/index_e.html

      ====        ________                ___________
  _D _|  |_______/        \__I_I_____===__|_________|
   |(_)---  |   H\________/ |   |        =|___ ___|      _________________ 
   /     |  |   H  |  |     |   |         ||_| |_||     _|                \_____A
  |      |  |   H  |__--------------------| [___] |   =|                        |
  | ________|___H__/__|_____/[][]~\_______|       |   -|                        |
  |/ |   |-----------I_____I [][] []  D   |=======|____|________________________|_
__/ =| o |=-~~\  /~~\  /~~\  /~~\ ____Y___________|__|__________________________|_
 |/-=|___||    ||    ||    ||    |_____/~\___/          |_D__D__D_|  |_D__D__D_|
  \_/      \__/  \__/  \__/  \__/      \_/               \_/   \_/    \_/   \_/

"SL (Steam Locomotive) runs across your terminal when you type "sl" as you meant to type 'ls'. It's just a joke command, and not usefull at all. Put the binary to /usr/local/bin."
share
edited Aug 12 '10 at 14:59
community wiki

2 revs, 2 users 88%
invert

    This is essentially a duplicate of this answer, but the engine has no way of indicating that – Michael Mrozek♦ Oct 6 '10 at 22:31

add a comment
17
votes

Sometimes I'll ssh into my machine at home and spook my wife (or the cat) by playing a message over the speakers using festival text-to-speech.

echo "Helllloooo!  Is anyone home?" | festival --tts

share
answered Aug 12 '10 at 16:15
community wiki

jjclarkson

    woww... that's kinda funny and kinda cruel... – xenoterracide Aug 12 '10 at 23:31
    5
    I once had an IM conversation with my wife in which she typed her messages into IM and I typed my replies into an ssh shell which spoke them to her. She nearly died laughing. It started when she was afk and I was trying to get her attention. She thought the computer had a virus. For a while I was pretending my replies were coming from the computer itself, as if she was having a conversation with it. – Neil Mayhew Sep 10 '10 at 21:55 

    4
    dd if=/dev/sda of=/dev/dsp - oh, thos happy days... – polemon Sep 11 '10 at 6:38

add a comment
16
votes

Append this line to ~/.bashrc (assuming the default shell is bash)

export PROMPT_COMMAND="cd"

No matter where the victim cd to, he/she will still end up in $HOME

From the bash man page:

    PROMPT_COMMAND  
        If set, the value is executed as a command prior to issuing each
        primary prompt.

share
answered Aug 11 '10 at 12:42
community wiki

Shawn Chin
add a comment
13
votes

cat<<EOF >> ~/.bashrc
alias cd='echo "Segmentation fault" && echo $* > /dev/null'
alias ls='echo "Segmentation fault"'
EOF

I'm sure you'd be able to find more creative variants of ~/.bashrc pranks.
share
answered Aug 11 '10 at 7:31
community wiki

Alex B
add a comment
12
votes

Not necessarily UNIX-specific, but I like modifying the /etc/hosts file:

127.0.0.1    google.com
127.0.0.1    slashdot.org
127.0.0.1    questionablecontent.net

et cetera, and then setting up Apache with an ErrorDocument 404 click_harder.html pointing to this page.
share
answered Aug 11 '10 at 10:50
community wiki

Lucas Jones

    4
    I'm not sure sending them to an error page that says IE will work on a *nix user. – xenoterracide Aug 12 '10 at 23:30
    1
    @xenoterracide: That's part of the prank. – David Thornley Aug 13 '10 at 12:34

add a comment
11
votes

I've used this re-direction script prank inside my office to turn browser images upside down.

You'd be amazed to see how people panic when they think they've acquired some type of virus.

You can also use the prank to make images blurry (you choose the degree of blurriness), pretty funny when you don't overdo it -- people think their eyes are tired or the monitor is wonky.
share
answered Aug 11 '10 at 15:15
community wiki

Dan

    D'oh! Beat me to it :) – Avery Payne Aug 12 '10 at 1:10
    There is a verson of this in the chrome extention gallery too, easy to slide in somebodies computer when you sit down to browse. – Caleb Oct 7 '10 at 11:47

add a comment
10
votes

...I'm not sure about harmless, but I once set my roommate's default runlevel to 6. That was an amusing afternoon (for me).
share
answered Aug 11 '10 at 7:42
community wiki

Matt Simmons

    Lol. Brilliant. :) – Lucas Jones Aug 11 '10 at 10:45
    Cruel and unusual. And oh so sweet. – Caleb Oct 7 '10 at 11:46

add a comment
8
votes

Heres a harmless prank.

You will be surprised how many people dont know about the tty stop character. So when your victim leaves his or her terminal, stop the terminal using Ctrl-S (thats what it generally is, stty -a would show you the key on that terminal). And then when the victim comes back, he or she will be trying hard to get the terminal back to life...

And if you find someone who keeps leaving his terminal.... you are really in luck!
share
answered Aug 11 '10 at 14:44
community wiki

execve

    1
    That's just evil. ;) I normally switch between using a Windows machine and often type C-s when saving.. It's a pain when you accidently hit it when ssh'ing to a linux machine.. – Patrick Oct 6 '10 at 8:01
    1
    For the record, you can return to normality by pressing Ctrl-C. – badp Oct 6 '10 at 10:45
    1
    Aha, that's what happened to me! Thanks to @badp that I'm learning about Ctrl-C now! But wait, the answer there tells us to use Ctrl-Q. Which is correct? – imz -- Ivan Zakharyaschev Apr 27 '11 at 12:32

add a comment
6
votes

My favorite is logging in to a nearby computer and playing cricket or frog sounds.

While working away in Miami FL, I had my whole family, back in Oregon, searching for a frog in the garage.
share
answered Aug 11 '10 at 14:13
community wiki

Stephen Jazdzewski
add a comment
5
votes

Back in school, in the CS lab (sun workstations at the time) I compiled mpg123 from source in my home directory (that was fun) and then whenever anyone would walk out of the lab (w/out locking their workstation), I would modify their .cshrc (the workstations default shell) to play "Imagine" by John Lennon whenever they logged in. It amused me to no end hearing that song, playing ever so quietly (the workstations only had internal speakers) from all over the lab any time of day or night that I walked in.
share
answered Aug 11 '10 at 14:38
community wiki

gabe.
add a comment
5
votes

alias cd="eject -T"

In ~/.${shell}rc

echo "sleep 1" >>~/.${shell}rc

Such fun :)
share
edited Jan 20 '12 at 13:49
community wiki

2 revs, 2 users 86%
Blue Peppers
add a comment
4
votes

One I really like is to alias ls="sl" (requires sl installed, which may or may not be a problem).

For those not in the know, sl is a program that, being a common typo of ls, was created to train you out of typing sl. It displays a rolling choo choo train, that you can't break out of with C-c or C-d (unless -e is passed).

You can even make it do different things with some parameters. Per sl(6):

   OPTIONS

       -a     An accident seems to happen. You'll feel pity for people who cry for help.

       -l     shows little one.

       -F     It flies.

       -e     Allow interrupt by Ctrl+C.

I don't recommend using -e if you're going to mess with your coworkers, but the rest have some serious laugh potential.
share
answered Aug 11 '10 at 15:24
community wiki

B.R.
add a comment
4
votes

Back in the days of terminal-only systems, I created a program that simulated the login program but just kept saying, "Login incorrect". I then set it running on a colleague's terminal while he was at lunch.

When he came back, he got really confused and panicked wondering if his password had changed or something, and actually called me over to ask me to help him with the problem. I started to make all sorts of plausible-sounding but useless suggestions for things he might try, and was able to get away with sounding completely innocent for several minutes, until finally he smelled a rat when I ran out of reasonable suggestions and started saying some truly outlandish things! We then had a good laugh over it together.
share
answered Sep 10 '10 at 22:08
community wiki

Neil Mayhew
add a comment
4
votes

This one works great on Windows, but can be applied to KDE or Gnome as well:

    Open some programs, just so it looks like a normal work session
    Make a screenshot of the whole desktop with all apps running
    Set all panels (or under windows the start bar) to hidden
    Move all Desktop icons to a folder outside the desktop
    Set the screenshot as desktop background image

It will look as if the computer completely hangs, however in fact it is working perfectly well. If you are especially mean, you might have in the screenshot a Firefox window with a tillating or embarrassing web site. (Don't do this in the office.)
share
answered Oct 5 '10 at 18:05
community wiki

fschmitt
add a comment
3
votes

Way back when I was in university, working late night on a project on a Unix terminal (just a tty, not X Windows), all of a sudden messages like "Are you hungry?" "Why are you still working?" "Deadline is tomorrow, just give up & go to sleep!" started appearing on my screen.

Turns out a buddy was across the room, cat'ing or echo'ing to my terminal's device (/dev/pts/<whatever>) -- the messages showed up directly on my terminal, without any kind of attribution (unlike write or wall).

These days systems are more locked down, I doubt it's as easy to find writeable terminal devices. Unfortunately this was many many years ago, so I haven't tried it in a long time, maybe there is a different way to do it now.
share
edited Aug 11 '10 at 15:16
community wiki

2 revs
Dan

    This actually works fine nowadays still :D – badp Oct 6 '10 at 10:48

add a comment
3
votes

For emacs users, there's the nefariously evil broken-keyboard.el which makes the victim think their keyboard has weird problems.
share
answered Aug 12 '10 at 0:49
community wiki

durin42
add a comment
1
vote

Add to .inputrc:

"nano": "vi"
"vi": "emacs"
"cd": "ls"

share
answered Jan 20 '12 at 11:11
community wiki

user1686
add a comment
1
vote

This one guy came up with a list of aliases that could be put in .bashrc when interviewing someone for a linux/unix sysadmin job position. I'll post the full list of aliases here, but if you wish you can read the full article here. I find it to be quite funny..

PS1="youAreHere/ "
export PS1
alias --='-'
alias ash='echo youAreHere/ '
alias bash='echo youAreHere/ '
alias cat='perl -l'
alias cd='cd .'
alias cp='echo cp'
alias csh='echo youAreHere/ '
alias df='echo /dev/dump 100% 100% 0% /tmp/jailfs/hoosegow/you'
alias echo='echo '
alias emacs='ed'
alias env='vmstat'
alias ex='ed'
alias exec='echo cannot fork'
alias exit='echo are you sure?'
alias id='echo user\(me\) group\(sadly the same\)'
alias joe='ed'
alias jsh='echo youAreHere/ '
alias kill='echo all dead'
alias ksh='echo youAreHere/ '
alias less='more ---x'
alias logout='echo are you sure?'
alias ls='echo .'
alias mkdir='echo making directory'
alias more='less </dev/null'
alias mv='echo stay'
alias netstat='cat /dev/random'
alias ping='ping /dev/null'
alias prompt='echo youAreHere/'
alias ps='echo you 501 501 0 Apr 1 ? 0:00 /usr/bin/vicks -vaporub'
alias pwd='echo you are here'
alias rm='echo can\'\''t find'
alias rmdir='removing directory'
alias set='iostat'
alias sh='echo youAreHere/ '
alias su='echo cannot su to'
alias sudo='exec'
alias touch='echo please don\'\''t touch'
alias unalias='echo no aliases found named'
alias vi='ed'
alias vim='ed'
alias w='echo x, y and z'
alias who='echo what?'
alias zsh='echo youAreHere/ '
# alias alias="sleep 5"  # Uncommenting that last line is optional ;)

share
answered Jan 20 '12 at 12:53
community wiki

pootzko
add a comment
1
vote

Most remembered prank that I ever played on others were two, while I was studying.

    Wrote a su wrapper which would ask for user's password and stash them into a writeable file for me and then proceed to normal su. At the end, I would have all the collection of user's password in the network and used to somehow tease them with whatever the user's password would refer to symbolically intimating them that I am aware of their passwords. It was fun though :-))

    I deployed a cgi script on a http instance that would in disguise, collect user's password saying that the authentication is by system and they would happily share their passwords to cgi script which would store them in a text file.

Had a nice fun, both related to password trickery. I would not encourage this now. As I am now in the shoes of System Administrator and strictly discourage people sharing their passwords not even on web. If doubtful, contact SysAdm for legitimacy of the site in the local network.
share
answered Jan 20 '12 at 14:09
community wiki

Nikhil Mulley
add a comment
0
votes

set DISPLAY variable to their PC name/IP.
open debug (wdb) windows to someones PC and they are confused whats happing. Of course their PC should have xwin running and xhost +.
share
answered Aug 11 '10 at 6:13
community wiki

Hemant
add a comment
0
votes

Works for X11 displays, if you can get to it, with "shortcuts" on the desktop:

    Add a folder on the desktop, call it "Horse porn".
    Use GIMP to take a screen shop of the whole desktop.
    Set the screen shot you took in step two as the wallpaper.
    Delete the "Horse porn" folder. You should still see the folder as it is part of the screen shot set as a wallpaper.
    Get stop watch and see how long it takes $user to work it out.

Works on Windows(TM) too.
share
answered Jan 20 '12 at 11:31
community wiki

Sardathrion - against SE abuse
add a comment
-9
votes

:(){ :|:& }:  //at your terminal

Warning: Its a fork bomb! But you should try it once ; )

A fork bomb is a process that clones (forks) itself, the clone then does the same, and those clones do the same, etc etc. It grows exponentially until all system resources are consumed, and the system hangs. It's a real nasty piece of work, and not a prank by any means
