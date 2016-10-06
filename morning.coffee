# Lovingly crafted by Rohan Likhite [rohanlikhite.com]

command: "finger `whoami`"


#Refresh time (default: 1/2 minute 30000)
refreshFrequency: 1000 * 60


#Body Style
style: """

  top: 5px
  left: 10px
  width: 1000px

  .text
   -webkit-font-smoothing: antialiased
   color: #458588
   font: 11px Osaka-Mono

"""

#Render function
render: -> """
  <div class="text">
  <span class="salutation"></span>
  <span class="name"></span>
  </div>

"""

  #Update function
update: (output, domEl) ->

  #Time Segmends for the day
  segments = ["morning", "afternoon", "evening", "night"]
  segmentsalt = ["Test", "Test2"]
  #Grab the name of the current user.
  #If you would like to edit this, replace "output.split(' ')" with your name
  name = "Jack"

  #Creating a new Date object
  date = new Date()
  hour = date.getHours()

  #timeSegment logic
  timeSegment = segments[0] if 4 < hour <= 11
  timeSegment = segments[1] if 11 < hour <= 17
  timeSegment = segments[2] if 17 < hour <= 24
  timeSegment = segments[3] if  hour <= 4

  #DOM manipulation
  $(domEl).find('.salutation').text("Good #{timeSegment}, Jack.")
