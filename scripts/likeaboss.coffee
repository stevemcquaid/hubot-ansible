# Description:
#   LIKE A BOSS
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   jrgifford

images = [
  "http://goo.gl/Pb9zgT",
  "http://goo.gl/7RpxAY",
  "http://goo.gl/vXmeHS",
  "http://goo.gl/7UmJkw",
  "http://goo.gl/w1cAzi",
  "http://goo.gl/Phsk0p",
  "http://goo.gl/kar3N1",
  "http://goo.gl/rEO6Al",
  "http://goo.gl/DGVlnM",
  "http://goo.gl/Q59OvI",
  "http://goo.gl/vzEKfK",
  "http://goo.gl/VfpmnU",
  "http://goo.gl/jM0m2D",
  "http://goo.gl/9wxdz2",
  "http://goo.gl/GE8Ugr",
  "http://goo.gl/xtyQZ2",
  "http://goo.gl/7GTpPU"
  ]

module.exports = (robot) ->
  robot.respond /like a boss|boss|like a baws|baws/i, (msg) ->
    msg.send msg.random images
