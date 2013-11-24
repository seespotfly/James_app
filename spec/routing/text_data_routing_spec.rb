require "spec_helper"

describe TextDataController do
  describe "routing" do

    it "routes to #index" do
      get("/text_data").should route_to("text_data#index")
    end

    it "routes to #new" do
      get("/text_data/new").should route_to("text_data#new")
    end

    it "routes to #show" do
      get("/text_data/1").should route_to("text_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/text_data/1/edit").should route_to("text_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/text_data").should route_to("text_data#create")
    end

    it "routes to #update" do
      put("/text_data/1").should route_to("text_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/text_data/1").should route_to("text_data#destroy", :id => "1")
    end

  end
end
