require 'spec_helper'

describe "Stores" do

  subject { page }

  # describe "index page" do
  #   before do
  #   	5.times { FactoryGirl.create(:store)}
  #     visit stores_path
  #   end
  #   it "should have correct titles" do
  #     page.should have_selector('h1', :text => 'Member Stores')
  #     page.should have_selector('th', :text => 'ID')
  #   end
  #   it "should have link to private pages" do
  #   	first(:link, 'private').click
  #   	page.should have_selector('h1', 'PRIVATE PAGE FOR')
  #   end
  #   it "should have link to publice pages" do
  #   	first(:link, 'public').click
  #   	page.should have_selector('h1', 'PUBLIC PAGE FOR')
  #   end
  # end

  describe "login" do
  	before do
  		@fred = FactoryGirl.create(:staff, name: "fred", email: "fred@email.com")
  		@friendlys = FactoryGirl.create(:store, name: "friendlys")
      @invite_1 = FactoryGirl.create(:invitation, staff_id: Staff.first.id, store_id: Store.first.id)
      visit root_path
    end
    it "should have correct titles" do
      page.should have_selector('h1', :text => 'Welcome to the Public/Private Store Data App!')
      page.should have_selector('h2', :text => 'Please sign in below')
    end
    it "should login with correct email and correct password" do
      fill_in "email", with: "fred@email.com"
      fill_in "password", with: "foobar"
      click_button "Sign in"
      page.should have_selector('h1', text: 'Member Stores')
      page.should have_selector('h2', text: 'Hi fred, welcome to Public/Private App!')
    end
    it "should not login with correct email and incorrect password" do
      fill_in "email", with: "fred@email.com"
      fill_in "password", with: "foobaz"
      click_button "Sign in"
      page.should_not have_selector('h1', text: 'Member Stores')
      page.should_not have_selector('h2', text: 'Hi fred, welcome to Public/Private App!')
    end
    it "should not login with incorrect email and correct password" do
      fill_in "email", with: "freddy@email.com"
      fill_in "password", with: "foobar"
      click_button "Sign in"
      page.should_not have_selector('h1', text: 'Member Stores')
      page.should_not have_selector('h2', text: 'Hi fred, welcome to Public/Private App!')
    end
  end
  describe "credentials" do
    before do
      @fred = FactoryGirl.create(:staff, name: "fred", email: "fred@email.com")
      @friendlys = FactoryGirl.create(:store, name: "friendlys")
      @invite_1 = FactoryGirl.create(:invitation, staff_id: Staff.first.id, store_id: Store.first.id, credential: "public")
      visit root_path
      fill_in "email or username", with: @fred.email
      fill_in "password", with: @fred.password
      click_button "Sign in"
    end
    it "should not go to private page" do
      first(:link, 'private').click
      page.should have_selector('h1', 'PUBLIC PAGE FOR')
    end
    it "should not go to private page" do
      @invite_1.update(credential: "private")
      first(:link, 'private').click
      page.should have_selector('h1', 'PRIVATE PAGE FOR')
    end
  end
end
