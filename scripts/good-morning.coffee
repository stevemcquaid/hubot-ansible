# Description:
#   Good Morning
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   morning|good morning
#
# Author:
#   smcquaid

ways_to_say_morning = [
  "Welcome to the cloud",
  "How are you today?",
  "[Coffeebot activated]",
  "I had a bad dream last night and I think I broke the cloud"
]

module.exports = (robot) ->
  robot.respond /morning|Morning|goodmorning|mornin/i, (msg) ->
    msg.send msg.random ways_to_say_morning
