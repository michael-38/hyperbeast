require 'rails_helper'

RSpec.feature "User login", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(name: 'Michael', email: 'mc@email.com', password: 'abcdef', password_confirmation: 'abcdef')
  end
    
    scenario "User clicks login link" do
      
      # ACT
      visit root_path
      page.find('a[href="/login"]').click
      sleep 2

      # DEBUG / VERIFY
      save_screenshot

      fill_in 'email', with: "mc@email.com"
      fill_in 'password', with: "abcdef"
      # expect(page).to have_css('a[href="/cart"]', text: "My Cart (1)")
      # expect(page).to have_css()
      save_screenshot
  
      find('[name=commit]').click
      sleep 2
      save_screenshot
    end

end