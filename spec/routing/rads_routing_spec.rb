require "rails_helper"

RSpec.describe RadsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rads").to route_to("rads#index")
    end

    it "routes to #new" do
      expect(:get => "/rads/new").to route_to("rads#new")
    end

    it "routes to #show" do
      expect(:get => "/rads/1").to route_to("rads#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rads/1/edit").to route_to("rads#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rads").to route_to("rads#create")
    end

    it "routes to #update" do
      expect(:put => "/rads/1").to route_to("rads#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rads/1").to route_to("rads#destroy", :id => "1")
    end

  end
end
