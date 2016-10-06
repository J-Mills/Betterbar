command: "date +\"%a %d %b\""

refreshFrequency: 10000

render: (output) ->
  htmlString = "<span class = 'icon'> </span><span>#{output}</span"

style: """
  -webkit-font-smoothing: antialiased
  color: #B16286
  font: 11px Osaka-Mono
  right: 60px
  top: 5px
  .icon
    font: 11px fontawesome
"""
