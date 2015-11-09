require 'test_helper'

describe RolesController do
  let(:role) { Role.create! name: 'agent' }
  let(:user) { Factory :user }

  before do
    sign_in user
  end

  # describe "with an authorized user" do
  #   [:admin, :roles].each do |user_role|
  #     before do
  #       user.add_role user_role
  #     end

  #     it "gets index" do
  #       get :index
  #       must_respond_with :success
  #     end

  #     it "gets new" do
  #       get :new
  #       must_respond_with :success
  #     end

  #     it "creates a new role" do
  #       -> {
  #         post :create, role: { name: 'deputy' }
  #       }.must_change 'Role.count'
  #       flash[:notice].wont_be_nil
  #       must_redirect_to roles_path
  #     end

  #     it "renders new on error" do
  #       -> {
  #         post :create, role: { name: '' }
  #       }.wont_change 'Role.count'
  #       assigns(:role).wont_be_nil
  #       must_render_template :new
  #     end

  #     it "gets edit" do
  #       get :edit, id: role
  #       must_respond_with :success
  #     end

  #     it "updates a role" do
  #       patch :update, id: role, role: { name: 'spy' }
  #       role.reload
  #       role.name.must_equal 'spy'
  #       flash[:notice].wont_be_nil
  #       must_redirect_to roles_path
  #     end

  #     it "renders edit on error" do
  #       patch :update, id: role, role: { name: '' }
  #       role.reload
  #       role.name.must_equal 'agent'
  #       assigns(:role).wont_be_nil
  #       must_render_template :edit
  #     end

  #     it "deletes a role" do
  #       role = Role.create!(name: 'agent')
  #       -> {
  #         delete :destroy, id: role
  #       }.must_change 'Role.count', -1
  #       must_redirect_to roles_path
  #     end
  #   end
  # end

  # describe "with an unauthorized user" do
  #   it "doesn't get index" do
  #     get :index
  #     must_respond_with :redirect
  #   end

  #   it "doesn't get new" do
  #     get :new
  #     must_respond_with :redirect
  #   end

  #   it "doesn't create a new role" do
  #     -> {
  #       post :create, role: { name: 'deputy' }
  #     }.wont_change 'Role.count'
  #     must_respond_with :redirect
  #   end

  #   it "doesn't get edit" do
  #     get :edit, id: role
  #     must_respond_with :redirect
  #   end

  #   it "doesn't update a role" do
  #     patch :update, id: role, role: { name: 'spy' }
  #     must_respond_with :redirect
  #     role.name.wont_equal 'spy'
  #   end

  #   it "doesn't delete a role" do
  #     role = Factory(:role)
  #     -> {
  #       delete :destroy, id: role
  #     }.wont_change 'Role.count'
  #     must_respond_with :redirect
  #   end
  # end
end
