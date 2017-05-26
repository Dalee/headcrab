after :skills do
  all_skills = Skill.all
  20.times do
    Resume.find_or_create_by(name: Faker::Name.name_with_middle) do |resume|
      resume.expected_salary = Faker::Number.positive(150_000, 300_000).to_i
      resume.contact_info = "Call me #{Faker::PhoneNumber.phone_number}"
      resume.job_search_status = true
      resume.skills = all_skills.sample(3)
    end
  end
end
