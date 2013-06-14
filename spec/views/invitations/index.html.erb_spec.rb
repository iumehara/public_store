require 'spec_helper'

describe "invitations/index" do
  before(:each) do
    assign(:invitations, [
      stub_model(Invitation,
        :staff_id => 1,
        :store_id => 2,
        :credential => "Credential"
      ),
      stub_model(Invitation,
        :staff_id => 1,
        :store_id => 2,
        :credential => "Credential"
      )
    ])
  end

  it "renders a list of invitations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Credential".to_s, :count => 2
  end
end
