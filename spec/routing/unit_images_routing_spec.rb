require "rails_helper"

RSpec.describe UnitImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/unit_images").to route_to("unit_images#index")
    end

    it "routes to #new" do
      expect(:get => "/unit_images/new").to route_to("unit_images#new")
    end

    it "routes to #show" do
      expect(:get => "/unit_images/1").to route_to("unit_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/unit_images/1/edit").to route_to("unit_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/unit_images").to route_to("unit_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/unit_images/1").to route_to("unit_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/unit_images/1").to route_to("unit_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/unit_images/1").to route_to("unit_images#destroy", :id => "1")
    end

  end
end
