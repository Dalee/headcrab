concern :Skillable do
  included do
    def decorate_object
      @object = "Admin::#{object_class}Decorator".constantize.decorate @object
    end

    def fill_associations!(object)
      query_object = params[object_to_text.to_sym] || {}
      object.skills = Skill.where id: query_object[:skills] if query_object[:skills].present?
      object.skills.build title: query_object[:new_skill] if query_object[:new_skill].present?
    end
  end
end
