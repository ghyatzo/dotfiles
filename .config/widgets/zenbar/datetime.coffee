command: "date +\"%a %d %b %Y %H:%M\""

refreshFrequency: 60000

render: (output) ->
  "<div class='date'>#{output}</div>"

style: """
  -webkit-font-smoothing: antialiased
  color: #eee8d5
  font: 10px Menlo
  top: 10px
  width: 100%

  .date
    text-align: center
"""
