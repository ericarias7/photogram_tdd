require 'rails_helper'


feature 'Index displays a list of posts' do
	background do
    user = create(:user)
  end

	scenario 'the index displays correct created post information' do 

	visit '/'
	click_link 'Log In'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

	post_one = create(:post, caption: "This is post one")
	post_two = create(:post, caption: "This is the second post") 
	#attach_file Rails.root.join('spec/files/images/grad_photo1.jpg')

	
	visit '/'
	expect(page).to have_content('This is post one')
	expect(page).to have_content('This is the second post')
	#expect(page).to have_css("img[src*='grad_photo1']")
	end
end 




