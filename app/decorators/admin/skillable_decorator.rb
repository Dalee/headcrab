module Admin
  module SkillableDecorator
    extend ActiveSupport::Concern

    included do
      def skills_list
        (object.skills.map { |skill| h.link_to(skill.title, h.admin_skill_path(skill)) }.join ', ').html_safe
      end

      def choose_skills_widget(form)
        Widgets::SkillWidget.new(self, form).to_safe_html
      end

      def new_skill; end
    end
  end
end
