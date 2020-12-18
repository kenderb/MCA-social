require 'rails_helper'
require 'spec_helper'

RSpec.describe Like, type: :feature do

  scenario 'likes successfully' do
    visit new_user_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    fill_in 'Enter the movie name', with: 'IT'
    fill_in 'Enter your opinion', with: 'Some opinion for the movie'
    click_on 'Create Opinion'
    click_on 'heart'
    expect(page).to have_content('You like an opinion')
  end

  scenario 'disliked successfully' do
    visit new_user_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    fill_in 'Enter the movie name', with: 'IT'
    fill_in 'Enter your opinion', with: 'Some opinion for the movie'
    click_on 'Create Opinion'
    click_on 'heart'
    click_on 'heart'
    expect(page).to have_content('You disliked an opinion')
  end
end
