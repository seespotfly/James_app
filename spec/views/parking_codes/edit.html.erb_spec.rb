require 'spec_helper'

describe "parking_codes/edit" do
  before(:each) do
    @parking_code = assign(:parking_code, stub_model(ParkingCode,
      :code => 1
    ))
  end

  it "renders the edit parking_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parking_code_path(@parking_code), "post" do
      assert_select "input#parking_code_code[name=?]", "parking_code[code]"
    end
  end
end
