require 'rails_helper'
require 'pry'
feature 'user successfully can edit his or hers own cell phone' do
  let(:user) {FactoryGirl.create(:user)}
  let!(:cell_phone) {FactoryGirl.create(:cell_phone, user: user)}

    scenario 'user edits cell phone name' do
       sign_in user
       visit cell_phone_path(cell_phone)
       click_link 'Edit the Cell Phone name here'
       fill_in "Name", with: "Iphone 8"
       click_button 'Save Changes'

        expect(page).to have_content("Iphone 8")
       expect(page).to have_content("Cell Phone Successfully Updated")

     end
   end


# save_and_open_page
#foundation
