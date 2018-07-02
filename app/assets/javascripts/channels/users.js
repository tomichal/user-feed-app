App.users = App.cable.subscriptions.create("UsersChannel", {
  connected: function() {
    console.log('Connected to UsersChannel')
  },
  disconnected: function() {
    console.log('Disconnected from UsersChannel')
  },
  received: function(data) {
    $('.alerts').replaceWith(data.alerts);
  }
});
