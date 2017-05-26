class ResumeSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :contact_info, :expected_salary

  has_many :skills

  attribute :links do
    {
      self: resume_path(object.id)
    }
  end

  attribute(:created_at) { I18n.l object.created_at.to_date, format: :long }
end
