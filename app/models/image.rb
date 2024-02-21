class Image < ApplicationRecord
  belongs_to :imagebank, polymorphic: true
  has_one_attached :file
end
