FactoryGirl.define do
  factory :vacancy do
    title Faker::Job.title
    expires_at Faker::Time.forward 30
    salary (Faker::Number.positive 10_000, 150_000).to_i
    contact_info Faker::Internet.email
  end
end
