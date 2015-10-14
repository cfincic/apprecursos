require "spec_helper"

describe TipoContratacionsController do
  describe "routing" do

    it "routes to #index" do
      get("/tipo_contrataciones").should route_to("tipo_contrataciones#index")
    end

    it "routes to #new" do
      get("/tipo_contrataciones/new").should route_to("tipo_contrataciones#new")
    end

    it "routes to #show" do
      get("/tipo_contrataciones/1").should route_to("tipo_contrataciones#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tipo_contrataciones/1/edit").should route_to("tipo_contrataciones#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tipo_contrataciones").should route_to("tipo_contrataciones#create")
    end

    it "routes to #update" do
      put("/tipo_contrataciones/1").should route_to("tipo_contrataciones#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tipo_contrataciones/1").should route_to("tipo_contrataciones#destroy", :id => "1")
    end

  end
end
