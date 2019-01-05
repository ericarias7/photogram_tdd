require 'rails_helper'

feature 'Editing posts' do 
  background do 
    post = create(:post)
    user = create(:user)

    visit '/'
    click_link 'Log In'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    visit '/'
    click_link(href: post_path(post))
    click_link 'Edit Post'
  end 

  scenario 'Can edit a post' do 
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre!")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end 
  
end 



