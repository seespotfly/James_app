require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :phone_number => "Phone Number",
      :company => "Company",
      :relationship => "Relationship"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Company/)
    rendered.should match(/Relationship/)
  end
end
