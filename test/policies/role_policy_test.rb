require 'test_helper'

describe RolePolicy do
  let(:user) { Factory :user, first_name: 'Luke', last_name: 'Skywalker' }
  let(:role) { Role.new name: 'sherrif' }

  describe "for authorized user" do
    [:admin, :roles].each do |user_role|
      before do
        user.add_role user_role
      end

      it "permits index" do
        :role.must_permit user, :index
      end

      it "permits show" do
        role.must_permit user, :show
      end

      it "permits new" do
        role.must_permit user, :new
      end

      it "permits create" do
        role.must_permit user, :create
      end

      it "permits edit" do
        role.must_permit user, :edit
      end

      it "permits update" do
        role.must_permit user, :update
      end

      it "permits destroy" do
        role.must_permit user, :destroy
      end
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :user.wont_permit user, :index
    end

    it "prohibits show" do
      user.wont_permit user, :show
    end

    it "prohibits new" do
      user.wont_permit user, :new
    end

    it "prohibits create" do
      user.wont_permit user, :create
    end

    it "prohibits edit" do
      user.wont_permit user, :edit
    end

    it "prohibits update" do
      user.wont_permit user, :update
    end

    it "prohibits destroy" do
      user.wont_permit user, :destroy
    end
  end
end
