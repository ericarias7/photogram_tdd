FactoryBot.define do
  factory :user do
    email 'fancyfrank@gmail.com'
    user_name 'Arnie'
    password 'illbeback'
    sequence(:id) { |id| id }
  end
end
