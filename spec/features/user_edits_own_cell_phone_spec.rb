require 'rails_helper'
require 'pry'
feature 'user successfully can edit his or hers own cell phone' do
  let(:user) {FactoryGirl.create(:user)}
  let!(:cell_phone) {FactoryGirl.create(:cell_phone)}

    scenario 'user edits cell phone name' do
      current_user = user
      @cell_phone = cell_phone
       sign_in user, scope: :user
       visit cell_phone_path(cell_phone)

       @cell_phone.user_id == current_user.id
       click_link 'Edit the Cell Phone name here'
       fill_in "Name", with: "Iphone 8"
       click_button 'Save Changes'

       expect(page).to have_content("Cell Phone Successfully Updated")
        expect(page).to have_content("Iphone 8")
     end
   end
