require 'spec_helper'


describe "Stores" do

  subject { page }

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
      @sonic = FactoryGirl.create(:store, name: "sonic")
      @invite_1 = FactoryGirl.create(:invitation, staff_id: Staff.first.id, store_id: Store.first.id, credential: "public")
    end
    it "shouldn't allow random to stores index page" do
      visit stores_path
      page.should have_selector('h1', :text => 'Welcome to the Public/Private Store Data App!')
      page.should have_selector('h2', :text => 'Please sign in below')
    end
    it "shouldn't allow random to public store page" do
      visit public_store_path(@friendlys)
      page.should have_selector('h1', :text => 'Welcome to the Public/Private Store Data App!')
      page.should have_selector('h2', :text => 'Please sign in below')
    end
    it "shouldn't allow random to private store page" do
      visit private_store_path(@friendlys)
      page.should have_selector('h1', :text => 'Welcome to the Public/Private Store Data App!')
      page.should have_selector('h2', :text => 'Please sign in below')
    end
    it "should allow public cred to public page" do
      valid_signin(@fred)
      first(:link, 'public').click
      page.should have_selector('h1', :text => 'PUBLIC PAGE FOR')
    end
    it "shouldn't allow public cred to private page" do
      valid_signin(@fred)
      first(:link, 'private').click
      page.should have_selector('h1', :text => 'Member Stores')
    end
    it "should allow private cred to private page" do
      valid_signin(@fred)
      @invite_1.update(credential: "private")
      first(:link, 'private').click
      page.should have_selector('h1', :text => 'PRIVATE PAGE FOR')
    end
    it "shouldn't allow non-staff private cred to public page" do
      valid_signin(@fred)
      @invite_1.update(credential: "private")
      page.all(:link, 'private')[1].click
      page.should have_selector('h1', :text => 'Member Stores')
    end
  end
end
