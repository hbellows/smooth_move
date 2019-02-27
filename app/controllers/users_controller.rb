# frozen_string_literal: true

class UsersController < ApplicationController
  helper_method :favorites

  def show
    favorites
  end

  private

  def favorites
    @favorites ||= current_user.favorites.active
  end
end