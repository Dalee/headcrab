module Admin
  class VacancyDecorator < Draper::Decorator
    include Admin::SkillableDecorator

    decorates :vacancy
    delegate_all
  end
end
