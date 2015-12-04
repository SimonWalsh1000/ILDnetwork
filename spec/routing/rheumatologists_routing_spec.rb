require "rails_helper"

RSpec.describe RheumatologistsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rheumatologists").to route_to("rheumatologists#index")
    end

    it "routes to #new" do
      expect(:get => "/rheumatologists/new").to route_to("rheumatologists#new")
    end

    it "routes to #show" do
      expect(:get => "/rheumatologists/1").to route_to("rheumatologists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rheumatologists/1/edit").to route_to("rheumatologists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rheumatologists").to route_to("rheumatologists#create")
    end

    it "routes to #update" do
      expect(:put => "/rheumatologists/1").to route_to("rheumatologists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rheumatologists/1").to route_to("rheumatologists#destroy", :id => "1")
    end

  end
end
