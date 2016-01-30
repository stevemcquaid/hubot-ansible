# Description:
#   Find/replace module inspired by the handy Willie library at
#   https://github.com/embolalia/willie/blob/master/willie/modules/find.py
#   More information on Willie at http://willie.dftba.net
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_SEDCHAT_MAXLINES: Maximum number of lines to cache for search/replace
#                           This is optional.
#
# Usage:
#   > nick: s/find/replace/flags
#   - nick is optional, and must be followed by a comma or colon
#   - flags (and anything after the third slash) are ignored
#
# Author:
#   djbkd (Christopher Eckhardt)
#
# Notes:
#   Original authors of the python library:
#   - Michael Yanovich yanovich.net
#   - Edward Powell emboladia.net
#   - Matt Meinwald
#   - Morgan Goose
#
# License:
#   The MIT License (MIT)
#
#   Copyright (c) 2013 GoDaddy
#
#   Permission is hereby granted, free of charge, to any person obtaining a copy
#   of this software and associated documentation files (the "Software"), to deal
#   in the Software without restriction, including without limitation the rights
#   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#   copies of the Software, and to permit persons to whom the Software is
#   furnished to do so, subject to the following conditions:
#
#   The above copyright notice and this permission notice shall be included in
#   all copies or substantial portions of the Software.
#
#   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#   THE SOFTWARE.

# Max number of lines of chat history to store per user
maxLines = process.env.HUBOT_SEDCHAT_MAXLINES || 10

# Say hello to the regex of death
sedRegex = /(?:(\S+)[:,]\s+)?s\/((?:\\\/|[^/])+)\/((?:\\\/|[^/])*)(?:\/(\S+))?/i


module.exports = (robot) ->
  robot.brain.on 'loaded', =>
    robot.brain.data.sedBuffer ||= {}


  # Create our chat buffer
  robot.hear /./, (msg) ->
    @nick = msg.message.user.name
    @line = msg.message.text
    robot.brain.data.sedBuffer["#{@nick}"] or= []

    unless @nick is robot.name or @line.match(sedRegex)
      if robot.brain.data.sedBuffer["#{@nick}"].length >= maxLines
        robot.brain.data.sedBuffer["#{@nick}"].shift()
      robot.brain.data.sedBuffer["#{@nick}"].push("#{@line}")


  robot.hear sedRegex, (msg) ->

    if not msg.match[1]?
      @targetUser = msg.message.user.name
    else
      @targetUser = msg.match[1]
    @targetPhrase = msg.match[2]
    @replacement = msg.match[3]

    robot.brain.data.sedBuffer["#{@targetUser}"] or= []

    if @targetUser is msg.message.user.name
      @prefix = "#{@targetUser} meant to say"
    else
      @prefix = "#{msg.message.user.name} thinks #{@targetUser} meant to say"


    for entry in robot.brain.data.sedBuffer["#{@targetUser}"]
      if entry.match("#{@targetPhrase}")
        msg.send "#{@prefix} #{entry.replace @targetPhrase, @replacement}"