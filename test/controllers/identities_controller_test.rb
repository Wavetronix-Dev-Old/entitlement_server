require "test_helper"

describe IdentitiesController do
  let(:identity) { Factory :identity }
  let(:user) { Factory :user, uid: identity.id }

  before do
    sign_in user
  end

  it "gets show" do
    get :show, id: identity
    must_respond_with :success
  end

  it "gets new" do
    get :new
    must_respond_with :success
  end

  it "handles authentication failures" do
    get :authentication_failure, message: "invalid_credentials"
    must_respond_with :redirect
    flash[:alert].wont_be_nil
  end

  it "deletes an identity" do
    identity = Factory(:identity)
    user = Factory(:user, uid: identity.id)
    -> {
      delete :destroy, id: identity
    }.must_change 'Identity.count', -1
    must_redirect_to sign_in_path
  end

  it "deletes cooresponding user when identity is deleted" do
    identity = Factory(:identity)
    user = Factory(:user, uid: identity.id)
    -> {
      delete :destroy, id: identity
    }.must_change 'User.count', -1
    must_redirect_to sign_in_path
  end

  it "updates an identity" do
    patch :update, id: identity, identity: { first_name: 'Zoey' }
    identity.reload
    identity.first_name.must_equal 'Zoey'
    flash[:notice].wont_be_nil
    must_redirect_to users_path
  end

  it "updates cooresponding user" do
  end



end
