11.times do
  Skill.find_or_create_by(title: Faker::Job.key_skill)
end
