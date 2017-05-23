require 'rails_helper'
require 'pry'

feature "Successfully add a review to a cell phone" do
 let!(:cell_phone) {FactoryGirl.create(:cell_phone)}

  scenario "add review to a cell phone" do
    @user = FactoryGirl.create(:user)
    sign_in @user, scope: :user
    visit cell_phone_path(cell_phone)
    fill_in "Name", with: "Great Phone!"
    click_button 'Submit Review'

    expect(page).to have_content("Thank you for posting a review!")
    expect(page).to have_content("Great Phone!")
  end
end

#ON TEST BRANCH!!
