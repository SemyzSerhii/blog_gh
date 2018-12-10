class Image < ApplicationRecord
  mount_uploader :url, CoverUploader

  belongs_to :imageable, polymorphic: true, optional: true
end
