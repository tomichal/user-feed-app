user1 = User.create(name: "Michal Tomaszewski", username: "michalt48", password: "test1234")
user2 = User.create(name: "John Doe", username: "jdoe", password: "test1234")
user3 = User.create(name: "Christina Pham", username: "cpham", password: "test1234")

user2.followed_users << user1
user2.followed_users << user3

