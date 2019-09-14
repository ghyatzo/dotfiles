command: "memory_pressure -v | awk -F': ' '/System-wide/ {print $2}' | cut -d % -f 1"

refreshFrequency: 30000 # ms

render: (output) ->
  "mem <span>#{100 - output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #eee8d5
  font: 10px Menlo
  right: 90px
  top: 10px
  span
    color: #aaa
"""
