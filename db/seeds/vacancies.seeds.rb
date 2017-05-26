after :skills do
  all_skills = Skill.all
  20.times do
    Vacancy.find_or_create_by(title: Faker::Job.title) do |vacancy|
      vacancy.salary = Faker::Number.positive(10_000, 150_000).to_i
      vacancy.expires_at = Faker::Time.forward 30
      vacancy.contact_info = Faker::Internet.email
      vacancy.skills = all_skills.sample(3)
    end
  end
end
