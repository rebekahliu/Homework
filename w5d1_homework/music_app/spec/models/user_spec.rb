require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(email: "rebekah", password: "password")
  end

  describe 'is_password?' do
    it 'returns true if password matches' do
      expect(user.is_password?("password")).to be(true)
    end

    it 'returns false if password does not match' do
      expect(user.is_password?("not_password")).to be(false)
    end
  end

  describe '#reset_session_token!' do
    it 'creates new session token' do
      old_session_token = user.ensure_session_token
      user.reset_session_token!
      expect(old_session_token).not_to be(user.session_token)
    end
  end

  describe '::find_by_credentials' do
    it 'finds by email and password' do
      user.save!
      expect(User.find_by_credentials("rebekah", "password")).to eq(user)
    end
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

end
