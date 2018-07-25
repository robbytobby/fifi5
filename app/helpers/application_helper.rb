# frozen_string_literal: true

module ApplicationHelper
  def current_role
    session[:current_role] ||= :user
  end
end
