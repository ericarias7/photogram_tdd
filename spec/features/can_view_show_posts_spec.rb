require 'spec_helper'

feature 'Can view individual posts' do
	background do
    user = create(:user)
  end
  #this calls factorybot user that we have created for rspec use. This can be found in /spec/users.rb
  #allows us to use Log In with the credentials specified below 

  scenario 'Can click and view a single post' do
    post = create(:post)

    visit '/'
    click_link 'Log In'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    visit '/posts'
    click_link(href: post_path(post))
    expect(page.current_path).to eq(post_path(post))
  end
end