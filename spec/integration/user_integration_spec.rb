require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :feature do
  scenario 'register successfully' do
    visit new_users_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    expect(page).to have_content('× Welcome juanito!')
  end

  scenario 'Sign in successfully' do
    visit new_users_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    click_on 'Log out'
    visit root_path
    fill_in 'Username', with: 'Juanito'
    click_on 'Login'
    expect(page).to have_content('Logged in successfully!')
  end
end
