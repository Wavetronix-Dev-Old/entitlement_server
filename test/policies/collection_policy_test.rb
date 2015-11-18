# require 'test_helper'

# describe CollectionPolicy do
#   let(:collection) { Factory :collection }
#   let(:user) { Factory :user }

#   describe "for authorized user" do
#     [:admin, :collections].each do |role|
#       before do
#         user.add_role role
#       end

#       it "permits index" do
#         :collection.must_permit user, :index
#       end

#       it "permits show" do
#         collection.must_permit user, :show
#       end

#       it "permits new" do
#         collection.must_permit user, :new
#       end

#       it "permits create" do
#         collection.must_permit user, :create
#       end

#       it "permits edit" do
#         collection.must_permit user, :edit
#       end

#       it "permits update" do
#         collection.must_permit user, :update
#       end

#       it "permits destroy" do
#         collection.must_permit user, :destroy
#       end
#     end
#   end

#   describe "for unauthorized user" do
#     it "prohibits index" do
#       :user.wont_permit user, :index
#     end

#     it "prohibits show" do
#       user.wont_permit user, :show
#     end

#     it "prohibits new" do
#       user.wont_permit user, :new
#     end

#     it "prohibits create" do
#       user.wont_permit user, :create
#     end

#     it "prohibits edit" do
#       user.wont_permit user, :edit
#     end

#     it "prohibits update" do
#       user.wont_permit user, :update
#     end

#     it "prohibits destroy" do
#       user.wont_permit user, :destroy
#     end
#   end
# end
