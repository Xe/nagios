import httpclient, json

const
  API_URL = "https://api.imvu.com/users/online"

proc onlineUsers*(): int =
  let
    response = getContent API_URL
    jTree = response.parseJson

  if jTree["status"].getStr != "success":
    raise newException(ValueError, response)

  result = jTree["denormalized"][API_URL]["data"]["count"].getNum().int()

when isMainModule:
  stdout.write $onlineUsers()
