# Description:
#   GOOD Night
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   good night
#
# Author:
#   noahhendrix

ways_to_say_good_night = [
  "Good night",
  "Sweet dreams",
  "Sleep tight, don't let the bed bugs bite",
  "So long, and thanks for all the fish.",
  "Finally",
  "À voir!",
  "TTYL",
  "C U L8R",
  "Cheers",
  "In a while, crocodile",
  "See you later, alligator"
]

module.exports = (robot) ->
  robot.respond /(goodnight|bye|nightnight|toodles|tootles|toodle|tootle|tschüss|tschuss)/i, (msg) ->
    msg.send msg.random ways_to_say_good_night
