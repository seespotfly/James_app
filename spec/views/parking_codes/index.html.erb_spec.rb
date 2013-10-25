require 'spec_helper'

describe "parking_codes/index" do
  before(:each) do
    assign(:parking_codes, [
      stub_model(ParkingCode,
        :code => 1
      ),
      stub_model(ParkingCode,
        :code => 1
      )
    ])
  end

  it "renders a list of parking_codes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
