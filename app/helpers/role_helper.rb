# frozen_string_literal: true

module RoleHelper
  def current_role
    (session[:current_role] ||= :user).to_sym
  end
end
