class IdentityPolicy < ApplicationPolicy
  def index?
    user && user.has_any_role?(:admin, :identities)
  end

  def show?
    user && (user.uid == record.id || user.has_any_role?(:admin, :identities))
  end

  def create?
    true
  end

  def update?
    user && (user.uid == record.id || user.has_any_role?(:admin, :identities))
  end

  def destroy?
    user && (user.uid == record.id || user.has_any_role?(:admin, :identities))
  end

  def manage?
    index?
  end
end
