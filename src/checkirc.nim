import commandeer, irc, nagios, net, random

const
  helpText = "Usage: checkirc <server> <port>"

commandline:
  argument host, string
  argument port, int
  exitoption "help", "h", helptext

if host == nil and port == 0:
  quit helpText

var client = newIRC(host, port=port.Port, nick="nagios-" & $randomInt(9001))

try:
  client.connect()

  while true:
    var event: TIRCEvent

    if client.poll(event):
      case event.typ
      of EvMsg:
        if event.numeric == "001":
          client.close

          okay host & " " & $port & " is UP and IRC connections work"
      else:
        critical "Cannot connect to " & host & " " & $port
except:
  critical getCurrentExceptionMsg()
