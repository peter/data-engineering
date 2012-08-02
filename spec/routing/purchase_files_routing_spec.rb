require "spec_helper"

describe PurchaseFilesController do
  describe "routing" do
    it "routes to #index" do
      get("/purchase_files").should route_to("purchase_files#index")
    end

    it "routes to #new" do
      get("/purchase_files/new").should route_to("purchase_files#new")
    end

    it "routes to #show" do
      get("/purchase_files/1").should route_to("purchase_files#show", :id => "1")
    end

    it "routes to #create" do
      post("/purchase_files").should route_to("purchase_files#create")
    end

    it "routes to #destroy" do
      delete("/purchase_files/1").should route_to("purchase_files#destroy", :id => "1")
    end
  end
end
