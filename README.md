Send a email to yourself (or anybody) with your IP.

To use it, update the .sh file with your stuff.


In order to run do not use your account password.
Enable two step verificarion on google account 

and

create a app password, use it instead of your real password.
https://support.google.com/mail/answer/185833?hl=en

also enable less secure apps in your account.
https://support.google.com/accounts/answer/6010255?hl=en


Good for homeworking without a fixed ip.

make file more secure with:
chown 0600 net_con.sh

make file executable with:
chmod +x net_con.sh

you can run it using:
./net_con.sh

or make it run terminal independent:
./net_con.sh & disown

add also to your /etc/rc.local (before line with 'exit 0') to run it everytime after boot as background process:

(sleep 3; /home/user/net_con.sh)&


