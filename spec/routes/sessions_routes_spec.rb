require "rails_helper"

RSpec.describe SessionsController, :type => :routing do
  describe "routing" do

    it "routes to sessions#new" do
      expect(:get => "/login").to route_to("sessions#new")
    end

    it "routes to sessions#create" do
      expect(:post => "/login").to route_to("sessions#create")
    end

    it "routes to sessions#destroy" do
      expect(:delete => "/logout").to route_to("sessions#destroy")
    end
  end
end
