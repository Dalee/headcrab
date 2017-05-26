FactoryGirl.define do
  factory :resume do
    name Faker::Name.name_with_middle
    contact_info Faker::PhoneNumber.phone_number
    job_search_status Faker::Boolean.boolean
    expected_salary Faker::Number.positive(50_000, 150_000).to_i
  end
end
