class Skill < ActiveRecord::Base
  include BaseObject

  has_and_belongs_to_many :resumes
  has_and_belongs_to_many :vacancies

  validates :title, uniqueness: true, presence: true

  self.searchable_fields = %i[title]
end
