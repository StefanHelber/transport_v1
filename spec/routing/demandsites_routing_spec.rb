require "spec_helper"

describe DemandsitesController do
  describe "routing" do

    it "routes to #index" do
      get("/demandsites").should route_to("demandsites#index")
    end

    it "routes to #new" do
      get("/demandsites/new").should route_to("demandsites#new")
    end

    it "routes to #show" do
      get("/demandsites/1").should route_to("demandsites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/demandsites/1/edit").should route_to("demandsites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/demandsites").should route_to("demandsites#create")
    end

    it "routes to #update" do
      put("/demandsites/1").should route_to("demandsites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/demandsites/1").should route_to("demandsites#destroy", :id => "1")
    end

  end
end
