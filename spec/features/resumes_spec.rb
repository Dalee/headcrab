describe 'Resumes', type: :feature do
  describe 'list', js: true do
    let!(:resume) { create :resume, job_search_status: true }
    before { visit resumes_path }

    it 'has proper title and search form' do
      expect(page).to have_text('Специалисты')
      expect(page).to have_field(class: 'resumes-list__area', type: :search)
      expect(page).to have_button(class: 'resumes-list__send')

      within('div.resumes-list__body') do
        expect(page).to have_link(class: 'resume__link', text: resume.name)
        expect(page).to have_text(resume.expected_salary)
      end
    end
  end

  describe 'search', js: true do
    let!(:bad_resume) { create :resume, job_search_status: true, name: 'Иван Фёдорович Крузенштерн' }
    let!(:resume) { create :resume, job_search_status: true }

    before do
      visit resumes_path

      within('form.resumes-list__form') do
        fill_in 'query', with: resume.name
        click_button 'Найти'
      end
    end

    it 'has proper title and search form' do
      within('div.resumes-list__body') do
        expect(page).not_to have_link(bad_resume.name)
        expect(page).to have_link(resume.name)
        expect(page).to have_text(resume.expected_salary)
      end
    end
  end
end
