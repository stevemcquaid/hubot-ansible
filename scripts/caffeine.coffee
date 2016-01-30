# Description:
#   Caffeinates you
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   coffee me - supply a user with coffee
#   hubot caffeinate me - Provides coffee
#   hubot <whatever> tired <whatever> - Provides coffee to combat sleepiness
#   hubot <whatever> sleepy <whatever> - Provides coffee to combat sleepiness
#
# Notes:
#   None
#
# Author:
#   meatballhat

coffeeImages = [
  "http://goo.gl/F4ysDv",
  "http://goo.gl/gyopRj",
  "http://goo.gl/dV4dSq",
  "http://goo.gl/fsZb8I",
  "http://goo.gl/txyzmc"
]

coffeeMe = (msg) ->
  msg.send msg.random(coffeeImages)

module.exports = (robot) ->
  robot.respond /caffeinate me/i, coffeeMe
  robot.respond /.*(tired|sleepy).*/i, coffeeMe
  robot.respond /coffee me/i, coffeeMe