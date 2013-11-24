require 'spec_helper'

describe "text_data/new" do
  before(:each) do
    assign(:text_datum, stub_model(TextDatum).as_new_record)
  end

  it "renders new text_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", text_data_path, "post" do
    end
  end
end
