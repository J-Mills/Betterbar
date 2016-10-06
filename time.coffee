command: "date +\"%H:%M\""

refreshFrequency: 10000 # ms

render: (output) ->
  htmlString = "<span class='icon'> </span>#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #458588
  font: 11px Osaka-Mono
  right: 10px
  top: 5px
  .icon
    font: 11px fontawesome
"""
