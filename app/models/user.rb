class User < ApplicationRecord
  attr_accessor :password, :remember_token, :activation_token, :reset_token
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  has_one :cover, as: :imageable, class_name: 'Image', dependent: :destroy
  accepts_nested_attributes_for :cover

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, email: true
  validates :password, length: { minimum: 6 }, presence: true

  before_save :encrypt_password, if: -> { password.present? }

  def self.authenticate(email, password)
    user = find_by(email: email)

    user if user&.correct_password?(password)
  end

  def correct_password?(password)
    password_hash == BCrypt::Engine.hash_secret(password, password_salt)
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private
  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
