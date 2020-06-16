notification_channel_subscribed = undefined
$(document).on('turbolinks:load', function() {
  if(!notification_channel_subscribed) {
    App.cable.subscriptions.create("ApplicationCable::NotificationsChannel", {
      received(data) {
        $('.result').append(data.message)
      }
    })
    notification_channel_subscribed = 1
  }
})