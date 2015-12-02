require "test_helper"

describe HomeController do
  let(:identity) { Factory :identity }
  let(:user) { Factory :user, uid: identity.id }

  it "redirects index when not signed in" do
    get :index
    must_respond_with :redirect
  end

  it "gets index when signed in" do
    sign_in user
    get :index
    must_respond_with :success
  end

end
