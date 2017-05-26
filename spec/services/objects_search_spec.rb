require 'rails_helper'

RSpec.describe ObjectsSearch do
  describe '.contains_param' do
    subject { described_class.contains_param(Vacancy) }
    it 'makes format param for ransack search' do
      is_expected.to eq :title_or_contact_info_or_skills_title_cont
    end
  end
end
