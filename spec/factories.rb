FactoryBot.define do
  factory :post do
    content { Forgery(:lorem_ipsum).paragraphs(rand(5) + 1) }
    user
  end

  factory :user do
    password "test1234"
    sequence :username do |n|
      "#{Forgery(:name).first_name.downcase}#{n}"
    end
  end
end