class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :popular, -> { order(likes_count: :desc) }

  has_one :cover, as: :imageable, class_name: 'Image', dependent: :destroy
  accepts_nested_attributes_for :cover



  validates :title, uniqueness: true, presence: true
  validates :body, presence: true

  def self.search(search)
  where('title || body ILIKE ?', "%#{search}%")
end
end
