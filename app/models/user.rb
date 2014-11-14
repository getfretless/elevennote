class User < ActiveRecord::Base
  has_secure_password
  has_many :notes
  validates :password, length: { minimum: 8 }, on: :create
  validates :username, presence: true, uniqueness: true
  before_create :generate_api_key

  def display_name
    name.presence || username
  end

  def generate_api_key
    self.api_key = BCrypt::Password.create(password_digest)
  end
end
