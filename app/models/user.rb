class User < ActiveRecord::Base
  has_secure_password
  has_many :notes
  validates :password, length: { minimum: 8 }
  validates :username, presence: true, uniqueness: true

  def display_name
    name.presence || username
  end
end
