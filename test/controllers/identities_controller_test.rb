require "test_helper"

describe IdentitiesController do
  it "gets new" do
    get :new
    must_respond_with :success
  end

  it "handles authentication failures" do
    get :authentication_failure, message: "invalid_credentials"
    must_respond_with :redirect
    flash[:alert].wont_be_nil
  end
end
