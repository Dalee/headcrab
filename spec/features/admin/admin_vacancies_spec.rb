describe 'admin vacancy pages', type: :feature do
  before do
    basic_auth ENV['TEST_USER'], ENV['TEST_PASSWORD']
  end

  describe 'index' do
    before { visit admin_vacancies_url }

    subject(:header) { find 'h1' }
    subject(:search_form) { find '#vacancy_search' }

    it 'displays proper header and controls' do
      expect(header).to have_text(t 'admin.vacancies.index.title')
      expect(search_form).to have_button(t 'helpers.links.search')
      expect(search_form).to have_link(t 'helpers.links.reset')
      expect(page).to have_link(t 'helpers.links.new')
    end
  end

  describe 'create' do
    before do 
      visit new_admin_vacancy_url

      within('form#new_vacancy') do
        fill_in :vacancy_title, with: Faker::Name.name
        fill_in :vacancy_contact_info, with: Faker::Hacker.say_something_smart
        fill_in :vacancy_expires_at, with: Faker::Date.forward(1.week)
        fill_in :vacancy_salary, with: Faker::Number.number(5)
        fill_in :vacancy_new_skill, with: Faker::Job.key_skill

        click_button t('admin.vacancies.form.save')
      end
    end

    it 'displays correct response' do
      expect(page).to have_http_status(:success)
      expect(page).to have_text t('admin.messages.object_created', model: Vacancy.model_name.human)
    end
  end
end