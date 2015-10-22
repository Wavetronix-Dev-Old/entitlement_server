require "test_helper"

describe UsersController do
  let(:user) { Factory :user }

  it "doesn't get index" do
    get :index
    must_redirect_to sign_in_path
  end

  it "doesn't get show" do
    get :show, id: user.id
    must_redirect_to sign_in_path
  end

  it "doesn't get edit" do
    get :edit, id: user.id
    must_redirect_to sign_in_path
  end

  it "doesn't delete a user" do
    user = Factory :user
    -> {
      delete :destroy, id: user.id
    }.wont_change "User.count"
    must_redirect_to sign_in_path
  end

end
