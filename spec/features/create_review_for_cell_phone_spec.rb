require 'rails_helper'
require 'pry'

feature "Successfully add a review to a cell phone" do
 let!(:cell_phone) {FactoryGirl.create(:cell_phone)}
 let(:user) {FactoryGirl.create(:user)}

  scenario "add review to a cell phone" do
    sign_in user
    visit cell_phone_path(cell_phone)
    fill_in "Name", with: "Great Phone!"
    click_button 'Submit Review'

    expect(page).to have_content("Thank you for posting a review!")
    expect(page).to have_content("Great Phone!")
  end

  scenario "user must be signed in to add a review" do
    visit cell_phone_path(cell_phone)

    expect(page).to have_content("You need to sign in")
  end
end

# unauthenticated user can not make a review
# authenticated user can not make a review with invalid data
