require 'spec_helper'

describe "text_data/edit" do
  before(:each) do
    @text_datum = assign(:text_datum, stub_model(TextDatum))
  end

  it "renders the edit text_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", text_datum_path(@text_datum), "post" do
    end
  end
end
