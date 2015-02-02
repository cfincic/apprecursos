require "spec_helper"

describe SedesController do
  describe "routing" do

    it "routes to #index" do
      get("/sedes").should route_to("sedes#index")
    end

    it "routes to #new" do
      get("/sedes/new").should route_to("sedes#new")
    end

    it "routes to #show" do
      get("/sedes/1").should route_to("sedes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sedes/1/edit").should route_to("sedes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sedes").should route_to("sedes#create")
    end

    it "routes to #update" do
      put("/sedes/1").should route_to("sedes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sedes/1").should route_to("sedes#destroy", :id => "1")
    end

  end
end
