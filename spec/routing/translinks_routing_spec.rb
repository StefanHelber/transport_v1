require "spec_helper"

describe TranslinksController do
  describe "routing" do

    it "routes to #index" do
      get("/translinks").should route_to("translinks#index")
    end

    it "routes to #new" do
      get("/translinks/new").should route_to("translinks#new")
    end

    it "routes to #show" do
      get("/translinks/1").should route_to("translinks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/translinks/1/edit").should route_to("translinks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/translinks").should route_to("translinks#create")
    end

    it "routes to #update" do
      put("/translinks/1").should route_to("translinks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/translinks/1").should route_to("translinks#destroy", :id => "1")
    end

  end
end
