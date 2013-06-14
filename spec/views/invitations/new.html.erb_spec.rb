require 'spec_helper'

describe "invitations/new" do
  before(:each) do
    assign(:invitation, stub_model(Invitation,
      :staff_id => 1,
      :store_id => 1,
      :credential => "MyString"
    ).as_new_record)
  end

  it "renders new invitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invitations_path, "post" do
      assert_select "input#invitation_staff_id[name=?]", "invitation[staff_id]"
      assert_select "input#invitation_store_id[name=?]", "invitation[store_id]"
      assert_select "input#invitation_credential[name=?]", "invitation[credential]"
    end
  end
end
