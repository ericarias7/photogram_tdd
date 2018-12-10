require 'spec_helper'

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    post = create(:post)

    visit '/posts'
    click_link(href: post_path(post))
    expect(page.current_path).to eq(post_path(post))
  end
end