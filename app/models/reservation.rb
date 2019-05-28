class Reservation < ApplicationRecord
  belongs_to :boxe
  belongs_to :user
  validates :start_date?
  validates :end_date_after_start_date?
  validates :total_price, presence: true

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "Must be after start date."
    end
  end

  def start_date?
    if start_date < Date.today
      errors.add :start_date, "Cannot be from the past."
    end
  end
end
