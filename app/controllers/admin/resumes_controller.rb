module Admin
  class ResumesController < ObjectsController
    include Skillable

    self.objects_on_page = 50
    self.object_class = Resume

    private

    def object_params
      params.require(object_to_text.to_sym).permit(:name, :contact_info, :job_search_status, :expected_salary)
    end
  end
end
