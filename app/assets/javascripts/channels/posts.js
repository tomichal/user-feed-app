App.posts = App.cable.subscriptions.create("PostsChannel", {
  connected: function() {
    console.log('connected')
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    console.log('new post created')
  }
});
