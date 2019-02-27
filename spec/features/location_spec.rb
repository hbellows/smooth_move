# frozen_string_literal: true

require 'rails_helper'

describe 'Location feature' do
  context 'User chooses a location from the search page' do
    it 'the show page displays statistics for that location' do
      user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith")
      user.locations.create!(geo_id: '16000US0820000')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit '/locations/16000US0820000'

      expect(page).to have_content('Denver, CO')
      expect(page).to have_content('Total Population')
      expect(page).to have_content('Average Age')
      expect(page).to have_content('Non-US Citizens')
      expect(page).to have_content('Mean Commute Time')
      expect(page).to have_content('Average Income')
      expect(page).to have_content('Owner-Occupied Houses')
    end
  end
end