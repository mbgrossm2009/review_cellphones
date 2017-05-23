require 'rails_helper'
require 'pry'

feature "view a cell phones show page" do
 let!(:cell_phone) {FactoryGirl.create(:cell_phone)}

  scenario "view a show page" do
    @user = FactoryGirl.create(:user)
    sign_in @user, scope: :user
    visit cell_phone_path(cell_phone)


    expect(page).to have_content(cell_phone.name)
  end
end
