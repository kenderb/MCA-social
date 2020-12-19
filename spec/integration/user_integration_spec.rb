require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :feature do
  scenario 'register successfully' do
    visit new_user_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    expect(page).to have_content('× Welcome juanito!')
  end

  scenario 'not register successfully' do
    visit new_user_path
    fill_in 'Username', with: ''
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    expect(page).to have_content('Something went wrong')
  end

  scenario 'Sign in successfully' do
    visit new_user_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    click_on 'Log out'
    visit root_path
    fill_in 'Username', with: 'Juanito'
    click_on 'Login'
    expect(page).to have_content('Logged in successfully!')
  end

  scenario 'not Sign in successfully' do
    visit new_user_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    click_on 'Log out'
    visit root_path
    fill_in 'Username', with: ''
    click_on 'Login'
    expect(page).to have_content('Email incorrect')
  end
end
