require "rails_helper"

RSpec.describe PhysiciansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/physicians").to route_to("physicians#index")
    end

    it "routes to #new" do
      expect(:get => "/physicians/new").to route_to("physicians#new")
    end

    it "routes to #show" do
      expect(:get => "/physicians/1").to route_to("physicians#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/physicians/1/edit").to route_to("physicians#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/physicians").to route_to("physicians#create")
    end

    it "routes to #update" do
      expect(:put => "/physicians/1").to route_to("physicians#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/physicians/1").to route_to("physicians#destroy", :id => "1")
    end

  end
end
