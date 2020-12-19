require 'rails_helper'
require 'spec_helper'

RSpec.describe Opinion, type: :feature do
  scenario 'Create a opinion successfully' do
    visit new_user_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    fill_in 'Enter the movie name', with: 'IT'
    fill_in 'Enter your opinion', with: 'Some opinion for the movie'
    click_on 'Create Opinion'
    expect(page).to have_content('Your opinion has been posted')
  end

  scenario 'not Create a opinion successfully' do
    visit new_user_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    fill_in 'Enter the movie name', with: ''
    fill_in 'Enter your opinion', with: 'Some opinion for the movie'
    click_on 'Create Opinion'
    expect(page).to have_content('movie name minmun of 2 maximun of 30 characters. Movie opinion minimum: 4, maximum: 120.')
  end
end
