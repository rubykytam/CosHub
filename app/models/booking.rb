class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cosplay

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_in_future, on: :create
  validate :end_date_in_future, on: :create
  validate :cannot_book_own_cosplay

  enum status: { pending: 'pending', accepted: 'accepted', rejected: 'rejected' }

  def start_date_in_future
    if start_date.present? && start_date <= Date.today
      errors.add(:start_date, "must be in the future")
    end
  end

  def end_date_in_future
    if end_date.present? && end_date <= start_date
      errors.add(:end_date, "must be later than the start date")
    end
  end

  def pending?
    status == 'pending'
  end

  def cannot_book_own_cosplay
    if user_id == cosplay.user_id
      errors.add(:base, "You cannot book your own cosplay item")
    end
  end
end
