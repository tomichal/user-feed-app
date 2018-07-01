App.posts = App.cable.subscriptions.create("PostsChannel", {
  connected: function() {
    console.log('Connected')
  },
  disconnected: function() {
    console.log('Disconnected')
  },
  received: function(data) {
    $('.post').prepend(data.post);
  }
});
