class Vacancy < ActiveRecord::Base
  include BaseObject
  include SkillableObject

  validates :title, presence: true
  validates :salary, numericality: { less_than: 100_000_000 }, allow_nil: true

  default_scope { order(salary: :desc) }

  scope(:actual, -> { where('expires_at >= ?', Date.today) })

  self.searchable_fields = %i[title contact_info skills_title]
end
