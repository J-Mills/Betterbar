command: "osascript -e 'tell application \"Mail\" to set unreadCount to unread count of inbox'"

refreshFrequency: 60000

style: """
  -webkit-font-smoothing: antialiased
  top: 5px
  right: 190px
  color: #B16286
  font: 11px Osaka-Mono

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 11px
    font-weight: 100

  .icon
    color: #B16286
    font: 11px fontawesome

  .mail
    color: #D5C4A1
"""


render: -> """
  <div class='mail-count'></div>
"""

update: (numberOfUnreadMails, domEl) ->
  $(domEl).find('.mail-count').html("<span class='mail'><span class='icon'>  </span> Mail:</span> #{numberOfUnreadMails}")
