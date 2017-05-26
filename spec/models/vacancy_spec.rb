RSpec.describe Vacancy, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_numericality_of(:salary).is_less_than(100_000_000).allow_nil }
  end
end
