class User < ApplicationRecord
  attr_accessor :password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, email: true
  validates :password, length: { minimum: 6 }, presence: true

  before_save :encrypt_password, if: -> { password.present? }

  def self.authenticate(username, password)
    user = find_by(username: username)

    user if user&.correct_password?(password)
  end

  def correct_password?(password)
    password_hash == BCrypt::Engine.hash_secret(password, password_salt)
  end

  private
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
