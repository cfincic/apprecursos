require "spec_helper"

describe DatoContactosController do
  describe "routing" do

    it "routes to #index" do
      get("/dato_contactos").should route_to("dato_contactos#index")
    end

    it "routes to #new" do
      get("/dato_contactos/new").should route_to("dato_contactos#new")
    end

    it "routes to #show" do
      get("/dato_contactos/1").should route_to("dato_contactos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dato_contactos/1/edit").should route_to("dato_contactos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dato_contactos").should route_to("dato_contactos#create")
    end

    it "routes to #update" do
      put("/dato_contactos/1").should route_to("dato_contactos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dato_contactos/1").should route_to("dato_contactos#destroy", :id => "1")
    end

  end
end
