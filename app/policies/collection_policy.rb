class CollectionPolicy < ApplicationPolicy
  def index?
    user && user.has_any_role?(:admin, :users)
  end

  def show?
    user && user.has_any_role?(:admin, :users)
  end

  def create?
    user && user.has_any_role?(:admin, :users)
  end

  def update?
    user && user.has_any_role?(:admin, :users)
  end

  def destroy?
    user && user.has_any_role?(:admin, :users)
  end
end
