App.posts = App.cable.subscriptions.create("PostsChannel", {
  connected: function() {
    console.log('Connected to PostsChannel')
  },
  disconnected: function() {
    console.log('Disconnected from PostsChannel')
  },
  received: function(data) {
    $('.post ul').prepend(data.post);
  }
});
