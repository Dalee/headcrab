describe 'admin skills pages', type: :feature do
  before do
    basic_auth ENV['TEST_USER'], ENV['TEST_PASSWORD']
  end

  describe 'index' do
    before { visit admin_skills_url }
    subject(:header) { find 'h1' }
    subject(:search_form) { find '#skill_search' }

    it 'displays proper header and controls' do
      expect(header).to have_text(t 'admin.skills.index.title')
      expect(search_form).to have_button(t 'helpers.links.search')
      expect(search_form).to have_link(t 'helpers.links.reset')
      expect(page).to have_link(t 'helpers.links.new')
    end
  end

  describe 'new' do
    before { visit new_admin_skill_url }
    subject(:form) { find 'form#new_skill' }
    it 'displays proper form' do
      expect(form).to have_field(:skill_title)
      expect(form).to have_button(t 'admin.skills.form.save')
      expect(form).to have_link(t 'helpers.links.cancel')
    end
  end

  describe 'create' do
    before do
      visit new_admin_skill_url

      within('form#new_skill') do
        fill_in :skill_title, with: Faker::Job.key_skill
      end
      click_button t('admin.skills.form.save')
    end

    it 'saves resume' do
      expect(page).to have_http_status(:success)
      expect(page).to have_text t('admin.messages.object_created', model: Skill.model_name.human)
    end
  end
end
