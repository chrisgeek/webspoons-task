require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_inclusion_of(:status).in_array User::VALID_STATUS }
  end

  describe 'validilty with or without attributes' do
    subject { build(:user) }

    it 'is valid with all attributes ' do
      expect(subject).to be_valid
    end

    it 'is not valid without name' do
      subject.name = nil

      expect(subject).to_not be_valid
    end

    it 'is not valid with invalid email format' do
      subject.email = 'invalid_email.com'

      expect(subject).to_not be_valid
    end
  end

  describe 'scope(s)' do
    before do
      create(:user, email: 'user1@example.com')
      create(:user, email: 'user2@example.com')
    end

    describe '#order_by_columns' do
      it 'returns the oldest user' do
        expect(described_class.order_by_columns.first.email).to eq 'user1@example.com'
      end
    end
  end
end
