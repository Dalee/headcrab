module Admin
  class ResumeDecorator < Draper::Decorator
    include Admin::SkillableDecorator

    decorates :resume
    delegate_all
  end
end
