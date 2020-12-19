require 'rails_helper'
require 'spec_helper'

RSpec.describe Following, type: :feature do
  scenario 'follow successfully' do
    visit new_user_path
    fill_in 'Username', with: 'Juanito'
    fill_in 'Fullname', with: 'Juanito Bailador'
    click_on 'Create User'
    click_on 'Log out'
    click_on 'Signup'
    fill_in 'Username', with: 'Juanito2'
    fill_in 'Fullname', with: 'Juanito2 Cantador'
    click_on 'Create User'
    edit_users_path = '/follow?user_id=1'
    find("a[href='#{edit_users_path}']").click
    expect(page).to have_content('You are now following')
  end
end
