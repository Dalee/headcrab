module Admin
  class VacanciesController < ObjectsController
    include Skillable

    self.objects_on_page = 50
    self.object_class = Vacancy

    private

    def object_params
      params.require(object_to_text.to_sym).permit(:title, :expires_at, :salary, :contact_info)
    end
  end
end
