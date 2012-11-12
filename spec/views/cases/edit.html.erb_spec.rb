require 'spec_helper'

describe "cases/edit" do
  before(:each) do
    @case = assign(:case, stub_model(Case,
      :number => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit case form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cases_path(@case), :method => "post" do
      assert_select "input#case_number", :name => "case[number]"
      assert_select "input#case_name", :name => "case[name]"
    end
  end
end
