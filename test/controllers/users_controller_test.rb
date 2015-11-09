require 'test_helper'

describe UsersController do
  let(:user) { Factory :user }
  let(:judge) { Factory :role, name: 'judge' }
  let(:jury) { Factory :role, name: 'jury' }

  before do
    sign_in user
  end

  # describe "with an authorized user" do
  #   [:admin, :users].each do |role|
  #     before do
  #       user.add_role role
  #     end

  #     it "gets index" do
  #       get :index
  #       must_respond_with :success
  #     end

  #     it "gets edit" do
  #       get :edit, id: user
  #       must_respond_with :success
  #     end

      it "updates a user" do
        patch :update, id: user, user: { role_ids: ["#{judge.id}"] }
        user.reload
        user.has_role?(:judge).must_equal true
        flash[:notice].wont_be_nil
        must_redirect_to users_path
      end

  #     it "renders edit on error" do
        skip 'There are no validations to fail by checking or unchecking roles'
  #       patch :update, id: user, user: { name: '' }
  #       user.reload
  #       user.name.must_equal 'agent'
  #       assigns(:user).wont_be_nil
  #       must_render_template :edit
  #     end

  #     it "deletes a user" do
  #       user = Factory(:user)
  #       -> {
  #         delete :destroy, id: user
  #       }.must_change 'User.count', -1
  #       must_redirect_to users_path
  #     end
  #   end
  # end

  # describe "with an unauthorized user" do
  #   it "doesn't get index" do
  #     get :index
  #     must_respond_with :redirect
  #   end

  #   it "doesn't get edit" do
  #     get :edit, id: user
  #     must_respond_with :redirect
  #   end

  #   it "doesn't update a user" do
  #     patch :update, id: user, user: { name: 'spy' }
  #     must_respond_with :redirect
  #     user.name.wont_equal 'spy'
  #   end

  #   it "doesn't delete a user" do
  #     user = Factory(:user)
  #     -> {
  #       delete :destroy, id: user
  #     }.wont_change 'User.count'
  #     must_respond_with :redirect
  #   end
  # end
end
