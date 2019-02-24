require 'rails_helper'

describe 'Search feature' do
  context 'User enters a location in the search box' do
    it 'the show page displays statistics for that location' do
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
end