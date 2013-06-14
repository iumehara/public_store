require 'spec_helper'

describe "invitations/edit" do
  before(:each) do
    @invitation = assign(:invitation, stub_model(Invitation,
      :staff_id => 1,
      :store_id => 1,
      :credential => "MyString"
    ))
  end

  it "renders the edit invitation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", invitation_path(@invitation), "post" do
      assert_select "input#invitation_staff_id[name=?]", "invitation[staff_id]"
      assert_select "input#invitation_store_id[name=?]", "invitation[store_id]"
      assert_select "input#invitation_credential[name=?]", "invitation[credential]"
    end
  end
end
