class FavoritesController < ApplicationController
  helper_method :favorite, :location

  def create
    if favorite && !favorite&.active?
      favorite.update_attributes(active: true)
    else
      current_user.locations << location
    end

    redirect_to dashboard_path
  end

  def update
    if favorite.active?
      favorite.update_attributes(active: false)
    else
      flash[:error] = 'Something went wrong with unfavoriting this location'
    end

    redirect_to dashboard_path
  end

  private

  def location
    @location ||= Location.find_or_create_by(geo_id: params[:geo_id])
  end

  def favorite
    @favorite ||= current_user.favorites.find_by(location: location)
  end
end