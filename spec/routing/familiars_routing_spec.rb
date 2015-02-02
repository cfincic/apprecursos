require "spec_helper"

describe FamiliarsController do
  describe "routing" do

    it "routes to #index" do
      get("/familiars").should route_to("familiars#index")
    end

    it "routes to #new" do
      get("/familiars/new").should route_to("familiars#new")
    end

    it "routes to #show" do
      get("/familiars/1").should route_to("familiars#show", :id => "1")
    end

    it "routes to #edit" do
      get("/familiars/1/edit").should route_to("familiars#edit", :id => "1")
    end

    it "routes to #create" do
      post("/familiars").should route_to("familiars#create")
    end

    it "routes to #update" do
      put("/familiars/1").should route_to("familiars#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/familiars/1").should route_to("familiars#destroy", :id => "1")
    end

  end
end
