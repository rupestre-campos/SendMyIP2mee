import smtplib
import ssl
import os
import socket
import sys

port = 465
addr = sys.argv[1] 
#app pasword
password = sys.argv[2] 
addr2 = sys.argv[3]
context = ssl.create_default_context()

def get_ip():
  if os.name == "posix":
    gw = os.popen("ip -4 route show default").read().split()
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect((gw[2], 0))
    ipaddr = s.getsockname()[0]
    gateway = gw[2]
    host = socket.gethostname()
    result = "{} {}".format(ipaddr, gateway)
    return result

with smtplib.SMTP_SSL("smtp.gmail.com", port, context=context) as server:
  server.login(addr, password)
  message = get_ip()
  print(message)
  server.sendmail(addr,addr2,message)
