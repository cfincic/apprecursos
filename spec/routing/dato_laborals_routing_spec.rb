require "spec_helper"

describe DatoLaboralsController do
  describe "routing" do

    it "routes to #index" do
      get("/dato_laborals").should route_to("dato_laborals#index")
    end

    it "routes to #new" do
      get("/dato_laborals/new").should route_to("dato_laborals#new")
    end

    it "routes to #show" do
      get("/dato_laborals/1").should route_to("dato_laborals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dato_laborals/1/edit").should route_to("dato_laborals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dato_laborals").should route_to("dato_laborals#create")
    end

    it "routes to #update" do
      put("/dato_laborals/1").should route_to("dato_laborals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dato_laborals/1").should route_to("dato_laborals#destroy", :id => "1")
    end

  end
end
