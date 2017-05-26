Rails.application.routes.draw do
  root 'head#index'

  concern :searchable do
    get 'search', on: :collection
  end

  %i[resumes vacancies].each do |resource_name|
    resources resource_name, only: %i[index show], concerns: :searchable
  end

  namespace :admin, path: 'cpanel' do
    root 'home#index'

    %i[resumes vacancies skills].each do |resource_name|
      resources resource_name, concerns: :searchable
    end
  end
end
