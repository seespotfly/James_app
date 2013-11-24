require 'spec_helper'

describe "text_data/index" do
  before(:each) do
    assign(:text_data, [
      stub_model(TextDatum),
      stub_model(TextDatum)
    ])
  end

  it "renders a list of text_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
