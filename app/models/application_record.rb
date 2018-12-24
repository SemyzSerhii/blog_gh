class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true



  def user_like(user)
    likes.find_by(user: user)
  end
end
