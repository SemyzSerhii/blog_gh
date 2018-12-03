class Post < ApplicationRecord
  belongs_to :user

  validates :title, uniqueness: true, presence: true
  validates :body, presence: true
end
