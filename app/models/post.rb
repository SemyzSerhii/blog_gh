class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, uniqueness: true, presence: true
  validates :body, presence: true
end
