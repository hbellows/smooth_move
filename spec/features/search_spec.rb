require 'rails_helper'

describe 'Search feature' do
  context 'User enters a location in the search box' do
    it 'the show page displays statistics for that location' do
      visit '/'

      fill_in :q,	with: "denver, co" 
      click_on 'Search'

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Denver')
    end
  end
end