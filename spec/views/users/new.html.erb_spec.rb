require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :phone_number => "MyString",
      :company => "MyString",
      :relationship => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_phone_number[name=?]", "user[phone_number]"
      assert_select "input#user_company[name=?]", "user[company]"
      assert_select "input#user_relationship[name=?]", "user[relationship]"
    end
  end
end
