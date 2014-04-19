require 'spec_helper'

describe Organization do

  subject{ build(:organization) }
  context "text counting" do
    context "originally" do
      its(:text_count){ should == 0 }
      it{ should be_under_limit }
      its(:texts_left){ should == 100 } #partner
    end
    context "after a text, under limit" do
      before(:each) do
        r = double("relationship")
        r.stub(:text_count).and_return(2)
        TextData.stub(:company_count).and_return(1)
        subject.stub(:relationship).and_return(r)
      end
      its(:text_count){ should == 1 }
      it{ should be_under_limit }
      its(:texts_left){ should == 1 }
    end
    context "after a text, at limit" do
      before(:each) do
        r = double("relationship")
        r.stub(:text_count).and_return(1)
        TextData.stub(:company_count).and_return(1)
        subject.stub(:relationship).and_return(r)
      end
      its(:text_count){ should == 1 }
      it{ should_not be_under_limit }
      its(:texts_left){ should == 0 }
    end
    context "after a text, after limit" do
      before(:each) do
        r = double("relationship")
        r.stub(:text_count).and_return(1)
        TextData.stub(:company_count).and_return(2)
        subject.stub(:relationship).and_return(r)
      end
      its(:text_count){ should == 2 }
      it{ should_not be_under_limit }
      its(:texts_left){ should == -1 }
    end
  end
end
