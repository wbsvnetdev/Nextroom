class Boxe < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  has_many :reviews, dependent: :destroy
  after_validation :geocode, if: :will_save_change_to_address?

  validates :price_per_day, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :caracteristics, presence: true

  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
