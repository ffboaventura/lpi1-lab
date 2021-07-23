#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#

import smtplib
from email.mime.text import MIMEText

msg_content = '<h2>Luke, I am your father!</h2>\n'
message = MIMEText(msg_content, 'html')

message['From'] = 'Darth Vader <darthvader@darkside.local>'
message['To'] = 'Luke Skywalker <luke@theforce.local>'
message['Subject'] = 'Big Surprise!'

msg_full = message.as_string()

server = smtplib.SMTP('rtr-01.darkside.local:25')
# server.starttls()
# server.login('user', 'pass')
server.sendmail(message['From'], message['To'], msg_full)

server.quit()
