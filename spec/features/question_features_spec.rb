require 'spec_helper'
feature "Questions" do
  
  background do
    @user = User.create!(alias: "Mr. Belvedere", buddy_image_url: "http://cdn.test.com/buddy_icon.jpg")
    Questionable::Question.create!(title: "Test 1", content: "hello there everybody", user_id: @user.id)
    Questionable::Question.create!(title: "Test 2", content: "test 2 question", user_id: @user.id)
  end
  
  scenario "should be listed on the index page" do
    visit '/questionable/questions'
    page.should have_content "hello there everybody"
  end
  
  scenario "should be viewable" do
    visit '/questionable/questions'
    page.click_link "Test 1"
    page.should have_selector('h1', text: "Test 1")
  end
  
  scenario "can be created by users" do
    visit '/questionable/questions'
    page.click_link "New Question"
    page.fill_in "question[title]", with: "my new question"
    page.fill_in "question[content]", with: "the content for my new question"
    page.click_button "Create Question"
    page.should have_selector('h1', text: "my new question")
  end
end