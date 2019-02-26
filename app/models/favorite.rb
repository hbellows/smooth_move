class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :location, uniqueness: { scope: :user_id }

  scope :active, ->{ where(active: true) }
  scope :eliminated, ->{ where(active: false) }
end
