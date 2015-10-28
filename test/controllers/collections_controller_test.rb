require "test_helper"

describe CollectionsController do
  it "gets index" do
    get :index
    must_respond_with :redirect
  end
end
