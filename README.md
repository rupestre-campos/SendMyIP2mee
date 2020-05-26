Send a email to yourself (or anybody) with your IP.

In order to run do not use your account password.
Enable two step verificarion on google account 
and
create a app password, use it instead of your real password.



Good for homeworking without a fixed ip.

add also to your /etc/rc.local (before line with 'exit 0') to run it everytime after boot:

(sleep 20; python3 /home/youruser/s_email.py)&
