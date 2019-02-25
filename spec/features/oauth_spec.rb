require 'rails_helper'

describe 'Google Oauth' do

  context 'User can log in with Google' do
    it 'logs a user into the application and redirects to user home page' do
      user_1 = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith")
      user_2 = User.create(uid: '6789', google_token: '9876', email: 'badexample@gmail.com', name: "Jane Smith")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit dashboard_path

      expect(page).to have_content('Welcome, John Smith')
      expect(page).to_not have_content('Jane Smith')
    end
  end

  context 'User can log out' do
    it 'logs a user out of the application' do
      user = User.create(uid: '1234', google_token: '4321', email: 'example@gmail.com', name: "John Smith")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_on "Log Out"

      expect(current_path).to eq('/')
    end
  end

end