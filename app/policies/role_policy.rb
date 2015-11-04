class RolePolicy < ApplicationPolicy
  def index?
    user && user.has_any_role?(:admin, :roles)
  end

  def show?
    user && user.has_any_role?(:admin, :roles)
  end

  def create?
    user && user.has_any_role?(:admin, :roles)
  end

  def update?
    user && user.has_any_role?(:admin, :roles)
  end

  def destroy?
    user && user.has_any_role?(:admin, :roles)
  end
end
