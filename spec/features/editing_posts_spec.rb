require 'rails_helper'

feature 'Editing posts' do 
  background do 
    user = create(:user)
    user_two = create(:user, email: 'hi@hi.com', user_name: 'BennyBoy', id: user.id + 1)
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: user.id + 1)

    visit '/'
    click_link 'Log In'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'
  end 

  scenario 'Can edit a post' do 
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated hombre!")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end 

  scenario "cannot edit a post that doesn't belong to you via the show page" do 
    visit "/posts/2/edit"
    expect(page).to_not have_content('Edit Post')
  end

  scenario "cannot edit a post that doesn't belong to you via url path" do 
    visit "/posts/2/edit"
    expect(page.current_path).to eq root_path 
    expect(page).to have_content("That post doesn't belong to you!")
  end 

end 



