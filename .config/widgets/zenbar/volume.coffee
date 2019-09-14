command: "osascript -e 'get volume settings' | cut -f2 -d':' | cut -f1 -d',';"

refreshFrequency: 2000 # ms

render: (output) ->
  "vol <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  font: 10px Menlo
  top: 10px
  right: 205px
  color: #eee8d5
  span
    color: #aaa
"""
