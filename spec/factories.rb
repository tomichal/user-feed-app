FactoryBot.define do
  factory :post do
    content { Forgery(:lorem_ipsum).paragraphs(rand(5) + 1) }
    user

    trait :public do
      after(:build) do |post|
        post.user.is_feed_public = true
        post.user.save!
      end
    end

    trait :private do
      after(:build) do |post|
        post.user.is_feed_public = false
        post.user.save!
      end
    end
  end

  factory :user do
    password "test1234"
    sequence :username do |n|
      "#{Forgery(:name).first_name.downcase}#{n}"
    end
  end
end