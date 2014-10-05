require "rails_helper"
require 'helpers/features_helper'

feature 'Visit homepage' do
  scenario 'check if homepage respond' do
    visit root_path
    expect(page).to have_content('Home')
  end

  scenario 'check if sign in works' do
    sign_in_with('user1@mail.com', '1q2w3e4r')
    expect(page).to have_content('Signed in successfully.')
  end

end