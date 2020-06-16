$(document).on('turbolinks:load', function() {
  App.cable.subscriptions.create("ApplicationCable::NotificationsChannel", {
    received(data) {
      $('.result').html(data.message)
    }
  })
})