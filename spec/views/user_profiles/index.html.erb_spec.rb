require 'spec_helper'

describe "user_profiles/index" do
  before(:each) do
    assign(:user_profiles, [
      stub_model(UserProfile,
        :profile_code => "Profile Code",
        :profile_name => "Profile Name",
        :profile_active => false,
        :profile_admin => false
      ),
      stub_model(UserProfile,
        :profile_code => "Profile Code",
        :profile_name => "Profile Name",
        :profile_active => false,
        :profile_admin => false
      )
    ])
  end

  it "renders a list of user_profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Profile Code".to_s, :count => 2
    assert_select "tr>td", :text => "Profile Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
