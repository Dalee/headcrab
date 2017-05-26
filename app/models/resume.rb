class Resume < ActiveRecord::Base
  include BaseObject
  include SkillableObject

  validates :name, presence: true
  validates :contact_info, presence: true
  validates :expected_salary, numericality: { less_than: 100_000_000 }, allow_nil: true

  validate :name_has_three_parts, :name_is_cyrillic, :contact_info_has_phone_or_email

  default_scope { order(expected_salary: :asc) }

  scope(:actual, -> { where(job_search_status: true) })

  self.searchable_fields = %i[name contact_info skills_title]

  private

  def name_has_three_parts
    return true if name.present? && name.split(/\s+/).size == 3
    errors.add(:name, :must_have_three_parts)
  end

  def name_is_cyrillic
    errors.add(:name, :must_be_cyrillic) unless name =~ /\A[\p{Cyrillic}\s]+\z/
  end

  def contact_info_has_phone_or_email
    # those days email could look very different, let's be flexible about it
    return true if Phonelib.parse(contact_info).valid? || contact_info =~ /\S+@\S+/

    errors.add(:contact_info, :must_have_phone_or_email)
  end
end
