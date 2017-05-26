describe 'Vacancies', type: :feature do
  describe 'list', js: true do
    let!(:vacancy) { create :vacancy }
    before { visit vacancies_path }

    it 'has proper title and search form' do
      expect(page).to have_text('Вакансии')
      expect(page).to have_field(class: 'vacancies-list__area', type: :search)
      expect(page).to have_button(class: 'vacancies-list__send')

      within('div.vacancies-list__body') do
        expect(page).to have_link(class: 'vacancy__link', text: vacancy.title)
        expect(page).to have_text(vacancy.salary)
      end
    end
  end

  describe 'search', js: true do
    let!(:bad_vacancy) { create :vacancy, title: 'Unbelivable Giant Robot Taking Over Internet' }
    let!(:vacancy) { create :vacancy }

    before do
      visit vacancies_path

      within('form.vacancies-list__form') do
        fill_in 'query', with: vacancy.title
        click_button 'Найти'
      end
    end

    it 'has proper title and search form' do
      within('div.vacancies-list__body') do
        expect(page).not_to have_link(bad_vacancy.title)
        expect(page).to have_link(vacancy.title)
        expect(page).to have_text(vacancy.salary)
      end
    end
  end
end
