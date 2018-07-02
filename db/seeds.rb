require "forgery"

def lorem_ipsum
  Forgery(:lorem_ipsum).paragraphs(rand(2) + 1)
end

[
  { username: "mt", name: "Michael Thom", password: "pass" },
  { username: "jd", name: "John Doe", password: "pass"  },
  { username: "cp", name: "Christina Pham", password: "pass" , is_feed_public: true },
  { username: "bs", name: "Bill Snazz", password: "pass" , is_feed_public: true },
  { username: "ps", name: "Phil Smart", password: "pass" },
  { username: "jq", name: "Jane Quick", password: "pass" },
  { username: "af", name: "Amanda Fey", password: "pass" }
].each do |user_attrs|
  user = User.find_or_create_by(user_attrs.slice(:username))
  user.attributes = user_attrs
  user.save!
end

{ "jd" => ["mt", "cp"] }.each do |follower, follows|
  User.find_by(username: follower).followed_users = User.where(username: follows)
end

User.all.each do |user|
  user.posts = (rand(7) + 1).times.map do |i|
    first_part = "Post #{i+1} by #{user.first_name} "
    max_length = rand(Post::MAX_LENGTH - first_part.length)
    Post.new(content: "#{first_part}#{lorem_ipsum[0..max_length]}")
  end
end