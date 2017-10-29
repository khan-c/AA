require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(email: 'Bob', password: 'password') }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe '#valid_password?' do
    it 'returns false if password provided does not match password_digest' do
      expect(user.valid_password?('random_pw')).to be(false)
    end
    it 'returns true if password does match' do
      expect(user.valid_password?('password')).to be(true)
    end
  end

  describe '#reset_session_token!' do
    it 'changes the user\'s session token' do
      token = user.session_token
      new_token = user.reset_session_token!
      expect(new_token).not_to eq(token)
    end
  end

  describe '::find_by_credentials' do
    before { user.save! }

    context 'valid user info provided' do
      it 'returns the user' do
        expect(User.find_by_credentials('Bob', 'password')).to eq(user)
      end
    end
    context 'invalid user info provided' do
      it "returns nil" do
        expect(User.find_by_credentials('Bob', 'huhwhatokbye')).to eq(nil)
      end
    end
  end
end
