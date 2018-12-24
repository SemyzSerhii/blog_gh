class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_many :likes, dependent: :destroy

  scope :popular, -> { order(likes_count: :desc) }

  validates :body, presence: true
end
