import posix

const
  OKAY* = 0
  WARNING* = 1
  CRITICAL* = 2
  UNKNOWN* = 3

proc exitWithStatus(status: int, message: string) {. noReturn .} =
  echo message
  exitNow status

proc okay*(message: string) =
  exitWithStatus OKAY, message

proc warning*(message: string) =
  exitWithStatus WARNING, message

proc critical*(message: string) =
  exitWithStatus CRITICAL, message

proc unknown*(message: string) =
  exitWithStatus UNKNOWN, message
