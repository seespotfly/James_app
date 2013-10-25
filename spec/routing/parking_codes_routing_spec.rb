require "spec_helper"

describe ParkingCodesController do
  describe "routing" do

    it "routes to #index" do
      get("/parking_codes").should route_to("parking_codes#index")
    end

    it "routes to #new" do
      get("/parking_codes/new").should route_to("parking_codes#new")
    end

    it "routes to #show" do
      get("/parking_codes/1").should route_to("parking_codes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/parking_codes/1/edit").should route_to("parking_codes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/parking_codes").should route_to("parking_codes#create")
    end

    it "routes to #update" do
      put("/parking_codes/1").should route_to("parking_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/parking_codes/1").should route_to("parking_codes#destroy", :id => "1")
    end

  end
end
