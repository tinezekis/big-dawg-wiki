require "rails_helper"

RSpec.describe UsersController, :type => :routing do
  describe "routing" do

    it "routes to users#new" do
      expect(:get => "/signup").to route_to("users#new")
    end

  end
end
