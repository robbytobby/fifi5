# frozen_string_literal: true

class RoleController < ApplicationController
  def update
    authorize :role, "#{params[:role]}?"
    session[:current_role] = params[:role]
    redirect_back(fallback_location: root_path)
  end
end
