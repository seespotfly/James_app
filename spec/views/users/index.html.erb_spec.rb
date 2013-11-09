require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :phone_number => "Phone Number",
        :company => "Company",
        :relationship => "Relationship"
      ),
      stub_model(User,
        :name => "Name",
        :phone_number => "Phone Number",
        :company => "Company",
        :relationship => "Relationship"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Relationship".to_s, :count => 2
  end
end
