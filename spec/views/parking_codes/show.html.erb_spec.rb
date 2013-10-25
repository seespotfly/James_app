require 'spec_helper'

describe "parking_codes/show" do
  before(:each) do
    @parking_code = assign(:parking_code, stub_model(ParkingCode,
      :code => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
