class User < ApplicationRecord
  validates :session_token, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password
  after_initialize :ensure_session_token

  def reset_session_token!
    self.session_token = ensure_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end
end
