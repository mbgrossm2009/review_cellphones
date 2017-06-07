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

  scenario 'unauthenticated user tries to create a new phone with no name' do
    visit cell_phones_path
    click_link 'Sign Up'
    @user = FactoryGirl.create(:user)
    sign_in @user, scope: :user
    visit new_cell_phone_path
    fill_in "Manufacturer", with: "Apple"
    click_button('Create')
    expect(page).to have_content("Name is too short")
  end
  
  scenario 'unauthenticated user tries to create a new phone with no manufacturer' do
    visit cell_phones_path
    click_link 'Sign Up'
    @user = FactoryGirl.create(:user)
    sign_in @user, scope: :user
    visit new_cell_phone_path
    fill_in "Name", with: "Iphone"
    click_button('Create')

    expect(page).to_not have_content("You have successfully created a phone!")
    expect(page).to have_content("Manufacturer can't be blank")
  end
end


# unauthenticated user tries to create new phone and fails
# authenticated user tries to create new phone with bad data
