command: "pmset -g batt | grep \"%\" | awk 'BEGINN { FS = \";\" };{ print $3,$2 }' | sed -e 's/-I/I/' -e 's/-0//' -e 's/;//' -e 's/;//'"

refreshFrequency: 1000 # ms

render: (output, domEl) ->

  values = output.split(' ')
  state = values[0]
  batnum = parseInt(values[1]);

  if state != 'discharging' and batnum >= 90
    htmlString = "<span class='charging'>  </span><span class='blue'><span class='icon'>  </span>#{batnum}%</span>"
  else if state != 'discharging' and batnum >= 50 and batnum < 90
    htmlString = "<span class='charging'>  </span><span class='blue'><span class='icon'>  </span>#{batnum}%</span>"
  else if state != 'discharging' and batnum < 50 and batnum >= 15
    htmlString = "<span class='charging'>  </span><span class='blue'><span class='icon'>  </span>#{batnum}%</span>"
  else if state != 'discharging' and batnum < 15
    htmlString = "<span class='charging'>  </span><span class='blue'><span class='icon'>  </span>#{batnum}%</span>"
  else if batnum >= 90
    htmlString = "<span class='green'><span class='icon'>  </span>#{batnum}%</span>"
  else if batnum >= 50 and batnum < 90
    htmlString = "<span class='green'><span class='icon'>  </span>#{batnum}%</span>"
  else if batnum < 50 and batnum >= 15
    htmlString = "<span class='yellow'><span class='icon'>  </span>#{batnum}%</span>"
  else if batnum < 15
    htmlString = "<span class='red'><span class='icon'>  </span>#{batnum}%</span>"

style: """
  -webkit-font-smoothing: antialiased
  font: 11px Osaka-Mono
  top: 5px
  right: 142px
  color: #FABD2F
  .green
    color: #7bc275
  .yellow
    color: #FABD2F
  .red
    color: #ff665c
  .blue
    color: #00b3ef
  .icon
    font: 11px fontawesome
  .charging
    color: #FFFFFF
    position: relative
    font: 8px fontawesome
    top: -1px
    right: -11px

i {
      font-size: 80%
}
"""
