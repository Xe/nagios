import commandeer, httpclient, nagios

const
  helptext = "Usage: checkhttp <url>"

commandline:
  argument url, string
  exitoption "help", "h", helptext

withStatus:
  discard url.getContent(timeout = 300_000)
  okay url & " responds to HTTP/S GET requests"
