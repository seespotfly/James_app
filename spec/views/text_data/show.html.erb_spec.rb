require 'spec_helper'

describe "text_data/show" do
  before(:each) do
    @text_datum = assign(:text_datum, stub_model(TextDatum))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
