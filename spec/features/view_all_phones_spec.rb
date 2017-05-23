require 'rails_helper'
require 'pry'

feature "View index page to see all phones" do
  let!(:cell_phone) {FactoryGirl.create(:cell_phone)}
  let!(:cell_phone2) {FactoryGirl.create(:cell_phone, name: "Iphone 9")}

  scenario "View all phones" do
    visit cell_phones_path

    expect(page).to have_content(cell_phone.name)
    expect(page).to have_content(cell_phone2.name)
  end
end


#edit and update spec
