class Cosplay < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :image

  SIZE = ['XS', 'S', 'M', 'L', 'XL']
  validates :size, presence: true
  validates :size, inclusion: { in: SIZE }
  validates :name, presence: true
  validates :source_material, presence: true
  validates :price, presence: true
end
