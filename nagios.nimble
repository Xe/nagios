# Package

version       = "0.1.0"
author        = "Christine Dodrill"
description   = "My nagios checks and a library for using them"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["checkhttp", "checkirc"]

# Dependencies

requires "nim >= 0.13.0", "commandeer", "irc", "random"

