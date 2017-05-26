class SkillSerializer < ActiveModel::Serializer
  attributes :id, :title

  belongs_to :resumes
  belongs_to :vacancies
end
