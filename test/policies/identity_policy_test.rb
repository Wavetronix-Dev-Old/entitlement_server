require 'test_helper'

describe IdentityPolicy do
  let(:identity) { Factory :identity }
  let(:user) { Factory :user }

  describe "for authorized user" do
    [:admin, :identities].each do |role|
      before do
        user.add_role role
      end

      it "permits index" do
        :identity.must_permit user, :index
      end

      it "permits show" do
        identity.must_permit user, :show
      end

      it "permits new" do
        identity.must_permit user, :new
      end

      it "permits create" do
        identity.must_permit user, :create
      end

      it "permits edit" do
        identity.must_permit user, :edit
      end

      it "permits update" do
        identity.must_permit user, :update
      end

      it "permits destroy" do
        identity.must_permit user, :destroy
      end
    end
  end

  describe "for identity owner" do
    let(:current_user) { Factory :user, uid: identity.id, first_name: identity.first_name, last_name: identity.last_name, email: identity.email, location: identity.location, description: identity.description }

    it "prohibits index" do
      :identity.wont_permit current_user, :index
    end

    it "permits show" do
      identity.must_permit current_user, :show
    end

    it "permits new" do
      identity.must_permit current_user, :new
    end

    it "permits create" do
      identity.must_permit current_user, :create
    end

    it "permits edit" do
      identity.must_permit current_user, :edit
    end

    it "permits update" do
      identity.must_permit current_user, :update
    end

    it "permits destroy" do
      identity.must_permit current_user, :destroy
    end
  end

  describe "for unauthorized user" do
    it "prohibits index" do
      :identity.wont_permit user, :index
    end

    it "prohibits show" do
      identity.wont_permit user, :show
    end

    it "permits new" do
      identity.must_permit user, :new
    end

    it "permits create" do
      identity.must_permit user, :create
    end

    it "prohibits edit" do
      identity.wont_permit user, :edit
    end

    it "prohibits update" do
      identity.wont_permit user, :update
    end

    it "prohibits destroy" do
      identity.wont_permit user, :destroy
    end
  end

  describe "for guest" do
    it "prohibits index" do
      :identity.wont_permit nil, :index
    end

    it "prohibits show" do
      identity.wont_permit nil, :show
    end

    it "permits new" do
      identity.must_permit nil, :new
    end

    it "permits create" do
      identity.must_permit nil, :create
    end

    it "prohibits edit" do
      identity.wont_permit nil, :edit
    end

    it "prohibits update" do
      identity.wont_permit nil, :update
    end

    it "prohibits destroy" do
      identity.wont_permit nil, :destroy
    end
  end
end
