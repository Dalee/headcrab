class VacancySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :contact_info, :salary

  has_many :skills

  attribute :links do
    {
      self: vacancy_path(object.id)
    }
  end

  attribute(:created_at) { I18n.l object.created_at.to_date, format: :long }
end
