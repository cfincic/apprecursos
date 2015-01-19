require "spec_helper"

describe TipoDocumentosController do
  describe "routing" do

    it "routes to #index" do
      get("/tipo_documentos").should route_to("tipo_documentos#index")
    end

    it "routes to #new" do
      get("/tipo_documentos/new").should route_to("tipo_documentos#new")
    end

    it "routes to #show" do
      get("/tipo_documentos/1").should route_to("tipo_documentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tipo_documentos/1/edit").should route_to("tipo_documentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tipo_documentos").should route_to("tipo_documentos#create")
    end

    it "routes to #update" do
      put("/tipo_documentos/1").should route_to("tipo_documentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tipo_documentos/1").should route_to("tipo_documentos#destroy", :id => "1")
    end

  end
end
