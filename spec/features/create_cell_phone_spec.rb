require 'rails_helper'
require 'pry'
feature 'successfully create a cell_phone' do

  scenario 'As an authenticated user, I want to add an item, So that others can review it' do
    visit cell_phones_path
    click_link 'Sign Up'
    @user = FactoryGirl.create(:user)
    sign_in @user, scope: :user
    visit new_cell_phone_path
    fill_in "Name", with: "Iphone"
    fill_in "Manufacturer", with: "Apple"
    click_button('Create')


    expect(page).to have_content("You have successfully created a phone!")
  end
end


# spec and rails helper
# helper method to sign in as a user ( google devise sign_in as helper method)
# write the test   create a user(factory_girl), sign_in as user using helper method, visit new_cell_phone_path,
# fill out form, the new cell phone shows up on the page
