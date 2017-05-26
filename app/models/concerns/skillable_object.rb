concern :SkillableObject do
  included do
    has_and_belongs_to_many :skills

    validate do |object|
      object.skills.each do |skill|
        errors.add(:skill, skill.errors.first.last) unless skill.valid?
      end
    end
  end
end
