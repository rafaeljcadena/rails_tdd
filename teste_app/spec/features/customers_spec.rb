require 'rails_helper'

RSpec.feature "Customers", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  it "'Visiting Customer's index" do
  	visit(customers_path)
  	# save_and_open_page
  	# page.save_screenshot('screenshot.png')
  	expect(page).to have_current_path(customers_path)
  end

  it 'Creating customer' do
  	member = create(:member)
  	login_as(member, scope: :user)
  	visit(new_customer_path)
  	fill_in('Name', with: Faker::Name.name)
  	fill_in('Email', with: Faker::Internet.email)

  	click_button('Create Customer')

  	expect(page).to have_content('/created/')
  end
end