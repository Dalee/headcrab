class ResumesController < ApplicationController
  def index
    render(
      component: 'ResumesListPage',
      props: {
        actions: { search: search_resumes_path },
        resumes: serialize(Resume.actual)
      }
    )
  end

  def show
    resume = Resume.actual.find(params[:id])
    full_related_vacancies, related_vacancies = ObjectsSearch.new(Vacancy.actual).find_related(resume, :skills, true)

    render(
      component: 'ResumesItemPage',
      props: {
        resume: serialize(resume),
        full_related_vacancies: serialize(full_related_vacancies),
        related_vacancies: serialize(related_vacancies)
      }
    )
  end

  def search
    search = ObjectsSearch.new(Resume.actual).find_contains(params[:query])
    render(
      component: 'ResumesListPage',
      props: {
        actions: { search: search_resumes_path },
        query: params[:query],
        resumes: serialize(search.try(:result))
      }
    )
  end
end
