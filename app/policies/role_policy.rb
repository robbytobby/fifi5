# frozen_string_literal: true

class RolePolicy < ApplicationPolicy
  def user?
    return false unless user.admin? || user.accountant?
    true
  end

  def accountant?
    user?
  end

  def admin?
    return false unless user.admin?
    true
  end
end
