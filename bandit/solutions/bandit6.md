- Here things started to get interesting, because I learned about something
  that I have seen, but didn't know exactly the meaning

So, this is the level goal:

>The password for the next level is stored somewhere on the server and has all
of the following properties:
- owned by user bandit7
- owned by group bandit6
- 33 bytes in size

If you are a linux user you are probably familiar with `ls`, that's a command
that will show the contents of a directory.
You may have stumped upon the familiar command `ll`, that also shows the contents
of a directory, but also show some aditional info.

Let's see what the `ll` command gives us and how some that info can be used
solving this level.

Running `ll` you will get something like:
```
-rw-rw-r-- 1 user group 413709 Nov  8 19:41 file.pdf
```
1. group -> is the group who owns that file.
1. user -> is the user who owns that file.

Running `ll /var/lib/dpkg/info/bandit7.password` you get:
```
-rw-r----- 1 bandit7 bandit6 33 Oct  5 06:19 /var/lib/dpkg/info/bandit7.password
```
So, as you can assimiliate:
- user = bandit7
- group = bandit6
That matches the level goal.

The command to find that path (/var/lib/dpkg/info/bandit7.password) was
`find / 2>/dev/null -group bandit6 -user bandit7 -size 33c`
Which looks for a file with all the requisites from the level, sending
any error (2) to /dev/null, so it doesn't poluate our screen.
