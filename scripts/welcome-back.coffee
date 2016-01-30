# Description:
#   Welcome Back
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   back
#
# Author:
#   smcquaid

ways_to_say_back = [
  "Welcome back",
  "I missed you",
]

module.exports = (robot) ->
  robot.respond /back|i'm back|I'm back|im back/i, (msg) ->
    msg.send msg.random ways_to_say_back
