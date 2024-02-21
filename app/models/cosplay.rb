class Cosplay < ApplicationRecord
  belongs_to :user
  has_many :bookings
  #has_many :images, as: :imagebank
  has_many_attached :images
  validate :validate_image_count, on: :update

  SIZE = ['XS', 'S', 'M', 'L', 'XL']
  validates :size, presence: true
  validates :size, inclusion: { in: SIZE }
  validates :name, presence: true
  validates :source_material, presence: true
  validates :price, presence: true

  def validate_image_count
    if images.length > 3
      errors.add(:base, "You can only upload up to 3 photos")
    end
  end

end
