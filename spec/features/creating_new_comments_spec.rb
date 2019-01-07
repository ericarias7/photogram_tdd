feature 'Creating comments' do 
	background do 
		user = create :user
		post = create(:post, user_id: user.id)

		visit '/'
    	click_link 'Log In'
    	fill_in 'Email', with: 'fancyfrank@gmail.com'
    	fill_in 'Password', with: 'illbeback'
    	click_button 'Log in'
  	end 

  	
end 