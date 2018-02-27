class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  before_save :set_total_price

  validates :start_date, presence:true
  validates :end_date, presence: true
  validate :check_start_date
  validate :check_end_date

  

  def check_start_date
    errors.add(:start_date, "Start date must be later than today") if start_date <= Date.today
  end

  def check_end_date
    errors.add(:end_date, "End date cannot be earlier than or same as start date") if start_date >= end_date
  end

  def set_total_price

    self.total_price = ((self.end_date - self.start_date)*(self.listing.price)).to_i

  end
  

end
