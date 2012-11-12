require 'spec_helper'

describe "user_profiles/new" do
  before(:each) do
    assign(:user_profile, stub_model(UserProfile,
      :profile_code => "MyString",
      :profile_name => "MyString",
      :profile_active => false,
      :profile_admin => false
    ).as_new_record)
  end

  it "renders new user_profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_profiles_path, :method => "post" do
      assert_select "input#user_profile_profile_code", :name => "user_profile[profile_code]"
      assert_select "input#user_profile_profile_name", :name => "user_profile[profile_name]"
      assert_select "input#user_profile_profile_active", :name => "user_profile[profile_active]"
      assert_select "input#user_profile_profile_admin", :name => "user_profile[profile_admin]"
    end
  end
end
