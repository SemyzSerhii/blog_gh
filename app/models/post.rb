class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one :cover, as: :imageable, class_name: 'Image', dependent: :destroy
  accepts_nested_attributes_for :cover


  validates :title, uniqueness: true, presence: true
  validates :body, presence: true
end
