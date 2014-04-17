require 'spec_helper'

describe TextData do
  pending "add some examples to (or delete) #{__FILE__}"

  context "determining date from body" do
    it "should parse a given date" do
      data = TextData.new
      data.text_body = "2013-10-12"
      date = data.parse_date_from_body
      date.should == Date.parse("2013-10-12")
    end
    it "should not die on trash" do
      data = TextData.new
      data.text_body = "mickey"
      date = data.parse_date_from_body
      date.should == nil
    end
    it "should parse default date" do
      data = TextData.new
      date = data.parse_date_from_body
      date.should == Date.today
    end
  end

  context "in code-per-date scheme" do

    context "population from Twilio" do

      before(:each) do
        @texter = build(:user)
        User.stub(:find_sender).and_return(@texter)
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
        its(:outgoing_sms_body){ should == "We do not have a parking code for that input.  Use YYYY-MM-DD with the date you'd like a code" }
      end

      context "date in past or not available" do
        before(:each) do
          @params = twilio_params(:Body => "2014-04-12")
        end
        it{ should be_valid }
        its(:text_success){ should == false }
        its(:outgoing_sms_body){ should == "We do not have a parking code for that input.  Use YYYY-MM-DD with the date you'd like a code" }
      end

      context "date available" do
        before(:each) do
          date = "2014-04-16"
          @pc = create(:parking_code, codedate: Date.parse(date))
          @params = twilio_params(:Body => date)
        end
        it{ should be_valid }
        its(:text_success){ should == true }
        its(:outgoing_sms_body){ should ==  "The parking code for 2014-04-16 is #{@pc.code}. You have 99 free codes left."}
      end

      context "date available, over limit" do
        before(:each) do
          @texter.organization = create(:tenant)
          @texter.save
          create(:text_datum, user: @texter)
          date = "2014-04-16"
          @pc = create(:parking_code, codedate: Date.parse(date))
          @params = twilio_params(:Body => date)
        end
        it{ should be_valid }
        its(:text_success){ should == true } 
        its(:outgoing_sms_body){ should ==  "The parking code for 2014-04-16 is #{@pc.code}. You're 1 over your limit."}
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
