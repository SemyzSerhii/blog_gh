class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true, optional: true
  belongs_to :comment, counter_cache: true, optional: true
end
