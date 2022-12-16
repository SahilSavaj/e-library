
import smtplib
 
# creates SMTP session
s = smtplib.SMTP('smtp.gmail.com', 587)
 
# start TLS for security
s.starttls()
 
# Authentication
s.login("bluephoenixmeditech@gmail.com", "Dishant@2022")
 
# message to be sent
message = "Message_you_need_to_send"
 
# sending the mail
s.sendmail("bluephoenixmeditech@gmail.com", "sahil121savaj@gmail.com", message)
 
# terminating the session
s.quit()