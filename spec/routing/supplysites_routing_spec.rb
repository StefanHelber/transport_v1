require "spec_helper"

describe SupplysitesController do
  describe "routing" do

    it "routes to #index" do
      get("/supplysites").should route_to("supplysites#index")
    end

    it "routes to #new" do
      get("/supplysites/new").should route_to("supplysites#new")
    end

    it "routes to #show" do
      get("/supplysites/1").should route_to("supplysites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supplysites/1/edit").should route_to("supplysites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supplysites").should route_to("supplysites#create")
    end

    it "routes to #update" do
      put("/supplysites/1").should route_to("supplysites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supplysites/1").should route_to("supplysites#destroy", :id => "1")
    end

  end
end
