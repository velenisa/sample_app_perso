require 'spec_helper'

describe "cases/new" do
  before(:each) do
    assign(:case, stub_model(Case,
      :number => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new case form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cases_path, :method => "post" do
      assert_select "input#case_number", :name => "case[number]"
      assert_select "input#case_name", :name => "case[name]"
    end
  end
end
