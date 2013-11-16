require 'spec_helper'

describe TextData do
  pending "add some examples to (or delete) #{__FILE__}"

  context "determining date from body" do
    it "should parse a given date" do
      data = TextData.new
      data.text_body = "2013-10-12"
      date = data.text_date
      date.should == Date.parse("2013-10-12")
    end
    it "should parse default date" do
      data = TextData.new
      date = data.text_date
      date.should == Date.today
    end
  end
end
