# Description:
#   Display a random gopher
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_SHIP_EXTRA_GOPHERS # Optional
#
# Commands:
#   go for it
#   went for it
#   going for it
#   goes for it
#
# Author:
#   dylanegan

gophers = [
  "http://goo.gl/gIW9Gn",
  "http://goo.gl/3Wf9Pp",
  "http://goo.gl/WAz6h4",
  "http://goo.gl/mntxmE",
  "http://goo.gl/PfYcTy",
  "http://goo.gl/a27jxy",
  "http://goo.gl/JLrTuf",
  "http://goo.gl/N07tNe",
  "http://goo.gl/Mn2Lt3",
  "http://goo.gl/rQVK85",
  "http://goo.gl/epXa2T",
  "http://goo.gl/rcwts2",
  "http://goo.gl/W6tFa9",
  "http://goo.gl/uq45J0",
  "http://goo.gl/GDnhCD",
  "http://goo.gl/fhrJK8",
  "http://goo.gl/ANRQl3",
  "http://goo.gl/aWdFN0",
  "http://goo.gl/jFL28E",
  "http://goo.gl/gX5SUc"
]

module.exports = (robot) ->

  # Enable a looser regex if environment variable is set
  if process.env.HUBOT_SHIP_EXTRA_GOPHERS
    regex = /(went|go(ing|es)?) for it/i
  else
    regex = /go for it/i

  robot.respond regex, (msg) ->
    msg.send msg.random gophers
