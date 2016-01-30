# Description:
#   Get a stock price
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot stock [info|quote|price] [for|me] <ticker> [tech|yahoo|finviz]- Get a stock price
#
# Author:
#   eliperkins
#   maddox
#   johnwyles

module.exports = (robot) ->
  robot.respond /stock (?:info|price|quote)?\s?(?:for|me)?\s?@?([A-Za-z0-9.-_]+)\s?(tech|yahoo|finviz)?/i, (msg) ->
    ticker = escape(msg.match[1])
    type = msg.match[2] || 'yahoo'
    msg.http('http://finance.google.com/finance/info?client=ig&q=' + ticker)
      .get() (err, res, body) ->
        result = JSON.parse(body.replace(/\/\/ /, ''))
        if (type == "tech" || type == "finviz")
            msg.send "http://finviz.com/chart.ashx?t=#{ticker}&ty=c&ta=1&p=d&s=l&hackyoapi.png"
        else if (type == "yahoo")
            msg.send "http://chart.finance.yahoo.com/z?s=#{ticker}&t=1d&q=l&l=on&z=l&a=v&p=s&lang=en-US&region=US#.png"
        msg.send result[0].l_cur + "(#{result[0].c})"
