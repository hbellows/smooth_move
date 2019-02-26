# frozen_string_literal: true

class UsersController < ApplicationController

  def show
    favorite_locations
  end

  private

  def favorite_locations
    favorite_ids = current_user.favorites.active.pluck(:location_id)
    @favorite_locations ||= Location.find_by(id: favorite_ids)
  end
end