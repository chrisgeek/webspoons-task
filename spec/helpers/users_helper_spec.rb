require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe '#user_status' do
    let(:user) { create(:user, status: 'inactive') }

    it { expect(helper.user_status(user)).to eq 'Activate' }
  end
end
