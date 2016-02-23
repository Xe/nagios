import imvu/onlineusers, nagios

try:
  let count = onlineUsers()

  if count == 0:
    critical "There are no users online. This is bad."

  okay "Connected user count is " & $count

except:
  critical getCurrentExceptionMsg()
