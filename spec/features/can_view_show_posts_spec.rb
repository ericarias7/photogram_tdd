require 'spec_helper'

feature 'Can view individual posts' do
	background do
    user = create :user
    post = create(:post, user_id: user.id)

    visit '/'
    click_link 'Log In'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'
  end
  #this calls factorybot user that we have created for rspec use. This can be found in /spec/users.rb
  #allows us to use Log In with the credentials specified below 

  scenario 'Can click and view a single post' do

    visit '/posts'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(1))
  end
end