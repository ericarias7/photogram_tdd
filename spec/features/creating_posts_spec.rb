require 'rails_helper.rb'

feature 'Creating posts' do 
	background do
    user = create(:user)
  end
	scenario 'can create a post' do 
		visit '/'
		click_link 'Log In'
    	fill_in 'Email', with: 'fancyfrank@gmail.com'
    	fill_in 'Password', with: 'illbeback'
    	click_button 'Log in'
		click_link 'New Post'
		attach_file('Image', "spec/files/images/grad_photo1.jpg")
		fill_in 'Caption', with: 'I cannot believe I am graduating! #steadyeating #bagsecured'
		click_button 'Create Post'
		expect(page).to have_content('#steadyeating')
		expect(page).to have_css("img[src*='grad_photo1.jpg']")
		expect(page).to have_content('Arnie')
	end 
it 'needs an image to create a post' do
	visit '/'
	click_link 'Log In'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
   	fill_in 'Password', with: 'illbeback'
    click_button 'Log in'
	click_link 'New Post'
	fill_in 'Caption', with: "No picture because YOLO"
	click_button 'Create Post'
	expect(page).to have_content('Halt, you fiend! You need an image to post here!')
end
end 
