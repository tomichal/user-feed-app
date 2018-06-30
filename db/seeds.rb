michal = User.create(name: "Michal Tomaszewski", username: "mt", password: "test1234")
john = User.create(name: "John Doe", username: "jd", password: "test1234")
christina = User.create(name: "Christina Pham", username: "cp", password: "test1234", is_feed_public: true)
bill = User.create(name: "Bill Snazz", username: "bs", password: "test1234", is_feed_public: true)

john.followed_users << michal
john.followed_users << christina

michal.posts.create(content: "Post 1 by Michal")
john.posts.create(content: "Post 1 by John")
christina.posts.create(content: "Post 1 by Christina")
bill.posts.create(content: "Post 1 by Bill")

