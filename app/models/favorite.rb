class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :location

  default_scope { where(active: true) }
end
