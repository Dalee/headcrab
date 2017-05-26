module Admin
  class SkillsController < ObjectsController
    self.objects_on_page = 10
    self.object_class = Skill

    private

    def object_params
      params.require(object_to_text.to_sym).permit(:title)
    end
  end
end
