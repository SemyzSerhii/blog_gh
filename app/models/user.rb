class User < ApplicationRecord
  attr_accessor :password
  has_many :posts, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :password, length: { minimum: 6 }, presence: true

  before_save :encrypt_password, if: -> { password.present? }



  private
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
