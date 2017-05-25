require 'spec_helper'

describe "Items API" do
  it "routes to #index" do
    get api_items_path
    response.status.should be(200)
  end
end
