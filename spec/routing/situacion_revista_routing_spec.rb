require "spec_helper"

describe SituacionRevistaController do
  describe "routing" do

    it "routes to #index" do
      get("/situacion_revista").should route_to("situacion_revista#index")
    end

    it "routes to #new" do
      get("/situacion_revista/new").should route_to("situacion_revista#new")
    end

    it "routes to #show" do
      get("/situacion_revista/1").should route_to("situacion_revista#show", :id => "1")
    end

    it "routes to #edit" do
      get("/situacion_revista/1/edit").should route_to("situacion_revista#edit", :id => "1")
    end

    it "routes to #create" do
      post("/situacion_revista").should route_to("situacion_revista#create")
    end

    it "routes to #update" do
      put("/situacion_revista/1").should route_to("situacion_revista#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/situacion_revista/1").should route_to("situacion_revista#destroy", :id => "1")
    end

  end
end
