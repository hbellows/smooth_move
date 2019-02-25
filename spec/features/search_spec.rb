# frozen_string_literal: true

require 'rails_helper'

describe 'Search feature' do
  context 'User enters a location in the search box' do
    it 'the index page shows a list of locations matching the city entered in the search box' do
      visit '/'

      fill_in :q,	with: "denver, co" 
      click_on 'Search'

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Denver, CO')
      expect(page).to have_content('Denver, PA')
      expect(page).to have_content('Denver, NC')
      expect(page).to have_content('Denver, IA')
      expect(page).to have_content('Denver, IN')
      expect(page).to have_content('Denver, MO')
      expect(page).to have_content('Denver City, TX')
    end
  end

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