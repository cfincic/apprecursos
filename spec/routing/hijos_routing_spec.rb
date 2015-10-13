require "spec_helper"

describe HijosController do
  describe "routing" do

    it "routes to #index" do
      get("/hijos").should route_to("hijos#index")
    end

    it "routes to #new" do
      get("/hijos/new").should route_to("hijos#new")
    end

    it "routes to #show" do
      get("/hijos/1").should route_to("hijos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hijos/1/edit").should route_to("hijos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hijos").should route_to("hijos#create")
    end

    it "routes to #update" do
      put("/hijos/1").should route_to("hijos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hijos/1").should route_to("hijos#destroy", :id => "1")
    end

  end
end
