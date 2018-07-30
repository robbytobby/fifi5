# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::Base
  include Pundit
  include RoleHelper

  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def pundit_user
    # rubocop:disable unused_method
    UserContext.new(current_user, session)
  end
end
