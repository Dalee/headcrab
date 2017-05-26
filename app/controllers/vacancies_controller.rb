class VacanciesController < ApplicationController
  def index
    render(
      component: 'VacanciesListPage',
      props: {
        actions: { search: search_vacancies_path },
        vacancies: serialize(Vacancy.actual)
      }
    )
  end

  def show
    vacancy = Vacancy.actual.find(params[:id])
    full_related_resumes, related_resumes = ObjectsSearch.new(Resume.actual).find_related(vacancy, :skills)

    render(
      component: 'VacanciesItemPage',
      props: {
        vacancy: serialize(vacancy),
        full_related_resumes: serialize(full_related_resumes),
        related_resumes: serialize(related_resumes)
      }
    )
  end

  def search
    search = ObjectsSearch.new(Vacancy.actual).find_contains(params[:query])
    render(
      component: 'VacanciesListPage',
      props: {
        actions: { search: search_vacancies_path },
        query: params[:query],
        vacancies: serialize(search.try(:result))
      }
    )
  end
end
