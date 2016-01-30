# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot beer me - Grab me a beer
#
# Author:
#  houndbee

beers = [
  "http://goo.gl/PjOxOy",
  "http://goo.gl/PjOxOy",
  "http://goo.gl/T8OjQ5",
  "http://goo.gl/HMddoz",
  "http://goo.gl/9LcmxY",
  "http://goo.gl/6Y9Ez7",
  "http://goo.gl/f2aibN",
  "http://goo.gl/C5PAJH",
  "http://goo.gl/68yXqb",
  "http://goo.gl/Lmk17f",
  "http://goo.gl/gGLt5W",
  "http://goo.gl/bWAfpi",
  "http://goo.gl/XogHrc",
  "http://goo.gl/zbqftm",
  "http://goo.gl/EhZKZj",
  "http://goo.gl/7N5dBp",
  "http://goo.gl/h7Vi9R"
]

beerMe = (msg) ->
  msg.send msg.random(beers)

module.exports = (robot) ->
  robot.respond /beer me/i, beerMe
  robot.respond /.*(drunk|thirsty).*/i, beerMe