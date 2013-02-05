require "spec_helper"

describe PagesController do
  describe "routing" do
    specify do
      get("/").should route_to("home#index")
    end
  end
end
