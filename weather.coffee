command: "/usr/local/bin/python3 ~/.kwm/scripts/weatherscript.py 2>/dev/null"

refreshFrequency: 10000 # ms

render: (output, domEl) ->

  values = output.split('@', 2);
  temp = values[0];
  condition = values[1];
  tempnum = parseInt(temp);
  connum = parseInt(condition);
  celciustemp = Math.round((parseInt(temp) - 32) * (5/9));

  htmlString = ""

  #add temp to htmlString

  if tempnum >= 90
    htmlString += "<span class='red'> #{celciustemp}° </span>" + htmlString;
  if tempnum < 90 and tempnum >= 65
    htmlString += "<span class='yellow'> #{celciustemp}° </span>" + htmlString;
  if tempnum < 65
    htmlString += "<span> #{celciustemp}° </span>" + htmlString;

  # Tornados and Hurricanes
  if connum <= 2
    htmlString = "<span class='red weather'></span>" + htmlString;
  #Thunderstorms
  if connum > 2 and connum <= 4
    htmlString = "<span class='yellow weather'></span>" + htmlString;
  #Freezing Rain / Sleet
  if (connum >= 5 and connum <= 8) or connum == 10 or connum == 18
    htmlString = "<span class='blue weather'></span>" + htmlString;
  #Drizzle
  if connum == 9
    htmlString = "<span class='blue weather'></span>" + htmlString;
  #Rain
  if connum == 11 or connum == 12
    htmlString = "<span class='blue weather'></span>" + htmlString;
  #Snow
  if connum >= 13 and connum <= 16
    htmlString = "<span class='blue weather'></span>" + htmlString;
  #Hail
  if connum == 17
    htmlString = "<span class='blue weather'></span>" + htmlString;
  #Dust, fog, haze, etc
  if connum >= 19 and connum <= 22
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  # Windy
  if connum == 23 or connum == 24
    htmlString = "<span class='grey weather'></span>" + htmlString;
  #cold
  if connum == 25
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  #cloudy
  if connum == 26
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  #mostly cloudy (night)
  if connum == 27
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  #mostly cloudy (day)
  if connum == 28
    htmlString = "<span class='grey weather'></span>" + htmlString;
  #partly cloudy (night)
  if connum == 29
    htmlString = "<span class='cyan weather'>></span>" + htmlString;
  #partly cloudy (day)
  if connum == 30
    htmlString = "<span class='grey weather'></span>" + htmlString;
  # clear night
  if connum == 31
    htmlString = "<span class='yellow weather'></span>" + htmlString;
  #Sunny
  if connum == 32
    htmlString = "<span class='yellow weather'></span>" + htmlString;
  #Fair, night
  if connum == 33
    htmlString = "<span class='yellow weather'></span>" + htmlString;
  #Fair, day
  if connum == 34
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  # mixed rain and hail
  if connum == 35
    htmlString = "<span class='blue weather'></span>" + htmlString;
  #hot
  if connum == 36
    htmlString = "<span class='red weather'></span>" + htmlString;
  #thunder storms
  if connum >= 37 and connum <= 39
    htmlString = "<span class='yellow weather'></span>" + htmlString;
  #scattered showers
  if connum == 40
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  # snow
  if connum >= 41 and connum <=43
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  #partly cloudy
  if connum == 44
    htmlString = "<span class='grey weather'></span>" + htmlString;
  #thunder showers
  if connum == 45
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  #snow showers
  if connum == 46
    htmlString = "<span class='cyan weather'></span>" + htmlString;
  # isolated thundershowers
  if connum == 47
    htmlString = "<span class='yellow weather'></span>" + htmlString;
  #Adding the wifi symbol
  if connum isnt 99
    htmlString += "<span class='green icon'>&nbsp&nbsp</span>";
  if connum is 99
    htmlString = "<span class='grey icon move'>&nbsp&nbsp</span>";
  else
    htmlString += "<span class ='yellow'></span>";


style: """
  -webkit-font-smoothing: antialiased
  font: 11px Osaka-Mono
  top: 2px
  right: 347px
  color: #D5C4A1
  .icon
    font: 11px fontawesome
  .move
    position: relative
    top: 3px
  .weather
    font: 11px WeatherIcons-Regular
  .blue
    color: #00b3ef
  .cyan
    color: #46d9ff
  .grey
    color: #b5babf
  .white
    color: #eeeeee
  .green
    color: #7bc275
  .yellow
    color: #ecbe7b
  .red
    color: #ff665c
"""
