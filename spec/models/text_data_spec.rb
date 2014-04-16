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

  context "in code-per-date scheme" do

    context "population from Twilio" do

      before(:each) do
        texter = build(:user)
        User.stub(:find_sender).and_return(texter)
        @params = twilio_params
        Setting.active.update_attribute(:code_scheme, 0)
      end

      subject { TextData.from_twilio(@params) }
      its(:text_body){ should == @params[:Body] }
      its(:message_sid){ should == @params[:MessageSid] }
      its(:sms_sid){ should == @params[:SmsSid] }
      its(:account_sid){ should == @params[:AccountSid] }
      its(:text_to){ should == @params[:To] }
      its(:text_from){ should == @params[:From] }
      its(:num_media){ should == @params[:NumMedia] }

      context "empty input" do
        it{ should be_valid }
        its(:text_success){ should == false }
      end

    end

  end

  context "in single-use-code scheme" do

    context "population from Twilio" do

      before(:each) do
        texter = build(:user)
        User.stub(:find_sender).and_return(texter)
        @params = twilio_params
        Setting.active.update_attribute(:code_scheme, 1)
      end

      subject { TextData.from_twilio(@params) }
      its(:text_body){ should == @params[:Body] }
      its(:message_sid){ should == @params[:MessageSid] }
      its(:sms_sid){ should == @params[:SmsSid] }
      its(:account_sid){ should == @params[:AccountSid] }
      its(:text_to){ should == @params[:To] }
      its(:text_from){ should == @params[:From] }
      its(:num_media){ should == @params[:NumMedia] }

      context "empty input" do
        it{ should be_valid }
        its(:text_success){ should == false }
      end

    end

  end
end
