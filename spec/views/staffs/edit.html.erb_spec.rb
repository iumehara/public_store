require 'spec_helper'

describe "staffs/edit" do
  before(:each) do
    @staff = assign(:staff, stub_model(Staff,
      :name => "MyString",
      :email => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the edit staff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", staff_path(@staff), "post" do
      assert_select "input#staff_name[name=?]", "staff[name]"
      assert_select "input#staff_email[name=?]", "staff[email]"
      assert_select "input#staff_password_digest[name=?]", "staff[password_digest]"
    end
  end
end
