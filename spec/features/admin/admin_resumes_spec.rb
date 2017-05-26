describe 'admin resume pages', type: :feature do
  before do
    basic_auth ENV['TEST_USER'], ENV['TEST_PASSWORD']
  end

  describe 'index' do
    before { visit admin_resumes_url }

    subject(:header) { find 'h1' }
    subject(:search_form) { find '#resume_search' }

    it 'displays proper header and controls' do
      expect(header).to have_text(t 'admin.resumes.index.title')
      expect(search_form).to have_button(t 'helpers.links.search')
      expect(search_form).to have_link(t 'helpers.links.reset')
      expect(page).to have_link(t 'helpers.links.new')
    end
  end

  describe 'new' do
    before { visit new_admin_resume_url }

    subject(:form) { find 'form#new_resume' }
    it 'displays proper form' do
      expect(form).to have_field(:resume_name)
      expect(form).to have_field(:resume_contact_info)
      expect(form).to have_unchecked_field(:resume_job_search_status)
      expect(form).to have_field(:resume_expected_salary)
      expect(form).to have_field(:resume_new_skill)
      expect(form).to have_button(t 'admin.resumes.form.save')
      expect(form).to have_link(t 'helpers.links.cancel')
    end
  end

  describe 'create' do
    before do
      visit new_admin_resume_url

      within('form#new_resume') do
        fill_in :resume_name, with: Faker::Name.name_with_middle
        fill_in :resume_contact_info, with: Faker::PhoneNumber.phone_number
        check :resume_job_search_status
        fill_in :resume_expected_salary, with: Faker::Number.number(5)
        fill_in :resume_new_skill, with: Faker::Job.key_skill

        click_button t('admin.resumes.form.save')
      end
    end

    it 'saves resume' do
      expect(page).to have_http_status(:success)
      expect(page).to have_text t('admin.messages.object_created', model: Resume.model_name.human)
    end
  end
end