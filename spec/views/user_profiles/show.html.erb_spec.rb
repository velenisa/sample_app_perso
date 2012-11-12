require 'spec_helper'

describe "user_profiles/show" do
  before(:each) do
    @user_profile = assign(:user_profile, stub_model(UserProfile,
      :profile_code => "Profile Code",
      :profile_name => "Profile Name",
      :profile_active => false,
      :profile_admin => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Profile Code/)
    rendered.should match(/Profile Name/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
