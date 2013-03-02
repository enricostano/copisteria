require "spec_helper"

describe VolantinosController do
  describe "routing" do

    it "routes to #index" do
      get("/volantinos").should route_to("volantinos#index")
    end

    it "routes to #new" do
      get("/volantinos/new").should route_to("volantinos#new")
    end

    it "routes to #show" do
      get("/volantinos/1").should route_to("volantinos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/volantinos/1/edit").should route_to("volantinos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/volantinos").should route_to("volantinos#create")
    end

    it "routes to #update" do
      put("/volantinos/1").should route_to("volantinos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/volantinos/1").should route_to("volantinos#destroy", :id => "1")
    end

  end
end
