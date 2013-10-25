require 'spec_helper'

describe "parking_codes/new" do
  before(:each) do
    assign(:parking_code, stub_model(ParkingCode,
      :code => 1
    ).as_new_record)
  end

  it "renders new parking_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parking_codes_path, "post" do
      assert_select "input#parking_code_code[name=?]", "parking_code[code]"
    end
  end
end
