describe 'admin home page', type: :feature do
  context 'without auth' do
    before { visit admin_root_url }

    it 'displays 401 not authorized' do
      expect(page).to have_http_status(:unauthorized)
      expect(page).to have_text 'Access denied'
    end
  end

  context 'with auth' do
    before do
      basic_auth ENV['TEST_USER'], ENV['TEST_PASSWORD']
      visit admin_root_url
    end

    it 'displays admin home' do
      expect(page).to have_http_status(:success)
      expect(page).not_to have_text 'Access denied'
    end
  end
end
