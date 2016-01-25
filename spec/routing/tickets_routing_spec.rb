require "rails_helper"

RSpec.describe TicketsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tickets").to route_to("tickets#index")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tickets/1").to route_to("tickets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tickets/1").to route_to("tickets#update", :id => "1")
    end
  end
end
