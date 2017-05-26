RSpec.describe Resume, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.not_to allow_value('Иехиел-Лейб бен Арье Файнзильберг').for(:name) }
    it { is_expected.to allow_value('Евгений Петрович Катаев').for(:name) }
    it { is_expected.not_to allow_value('Ипполит Matveevich Воробьянинов').for(:name) }

    it { is_expected.to validate_presence_of :contact_info }
    it { is_expected.to allow_value('Mail me somebody@over.moon').for(:contact_info) }
    it { is_expected.to allow_value('+7(495)606-36-02, Batman').for(:contact_info) }
    it { is_expected.not_to allow_value('Robin 01').for(:contact_info) }
    it { is_expected.to validate_numericality_of(:expected_salary).is_less_than(100_000_000).allow_nil }

  end
end
