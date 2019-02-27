# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :google_token, presence: true
  validates :uid, presence: true
  validates :name, presence: true

  has_many :favorites
  has_many :locations, through: :favorites

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      uid: auth[:uid],
      email: auth[:info][:email],
      name: auth[:info][:name],
      google_token: auth[:credentials][:token]
    }
    user.save!
    user
  end

  def favorited?(geo_id)
    location = locations.find_by(geo_id: geo_id)
    favorites.active.find_by(location_id: location&.id)
  end

  def eliminated_favorite?(geo_id)
    location = locations.find_by(geo_id: geo_id)
    favorites.eliminated.find_by(location_id: location&.id)
  end
end
