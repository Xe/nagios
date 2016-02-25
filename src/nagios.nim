import posix

const
  OKAY*     = 0 ## Service is okay
  WARNING*  = 1 ## Service is at a warning state
  CRITICAL* = 2 ## Service is critical
  UNKNOWN*  = 3 ## Service is unknown

proc exitWithStatus(status: int, message: string) {. noReturn .} =
  echo message
  exitNow status

proc okay*(message: string) =
  ## Exit with all being clear
  exitWithStatus OKAY, message

proc warning*(message: string) =
  ## Exit as a warning
  exitWithStatus WARNING, message

proc critical*(message: string) =
  ## Exit as critical
  exitWithStatus CRITICAL, message

proc unknown*(message: string) =
  ## Exit as unknown
  exitWithStatus UNKNOWN, message

template withStatus*(body: expr): expr =
  ## Try to do something, exploding if there's an exception
  try:
    body
  except:
    unknown getCurrentExceptionMsg()
