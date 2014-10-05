require "rails_helper"
require 'helpers/features_helper'

feature 'Create event' do

  scenario 'got to event form' do
    init_event_types
    sign_in_as_admin
    expect(page).to have_content('New event')

    visit new_event_path
    expect(page).to have_content('Name')

    click_button "Create Event"
    expect(page).to have_content("Please fix all errors to proceed")

    fill_in 'Name', with: 'Test event'
    fill_in 'Due date', with: '2014-10-23'
    fill_in 'Description', with: 'Lorem ipsum dolor sit amet'
    check 'Admin'
    click_button "Create Event"
    expect(page).to have_content("Event created")

    visit homepage_path
    click_link 'Agenda'
    expect(page).to have_content('Test event')
  end

end