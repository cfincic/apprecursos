require "spec_helper"

describe AgrentesController do
  describe "routing" do

    it "routes to #index" do
      get("/agrentes").should route_to("agrentes#index")
    end

    it "routes to #new" do
      get("/agrentes/new").should route_to("agrentes#new")
    end

    it "routes to #show" do
      get("/agrentes/1").should route_to("agrentes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/agrentes/1/edit").should route_to("agrentes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/agrentes").should route_to("agrentes#create")
    end

    it "routes to #update" do
      put("/agrentes/1").should route_to("agrentes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/agrentes/1").should route_to("agrentes#destroy", :id => "1")
    end

  end
end
