# frozen_string_literal: true

require 'rails_helper'

describe 'Location feature' do
  context 'User chooses a location from the search page' do
    it 'the show page displays statistics for that location' do
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