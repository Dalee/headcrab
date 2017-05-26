module Admin
  module Widgets
    class SkillWidget
      attr_reader :decorator, :form

      def initialize(decorator, form)
        @decorator = decorator
        @form = form
      end

      def to_safe_html
        [select_skills, new_skill].join('<br>').html_safe
      end

      delegate :h, :skills, to: :decorator

      private

      def select_skills
        form.select(
          :skills,
          h.options_from_collection_for_select(Skill.all, :id, :title, skills.ids),
          {},
          class: 'chosen-select',
          multiple: true,
          data: select_skills_placeholders
        )
      end

      def new_skill
        form.text_field(
          :new_skill,
          style: 'width: 100%',
          placeholder: h.t('admin.skills_widget.or_enter_new')
        )
      end

      def select_skills_placeholders
        {
          no_selected_text: h.t('admin.skills_widget.no_results_found'),
          placeholder: h.t('admin.skills_widget.select_placeholder')
        }
      end
    end
  end
end
