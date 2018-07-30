# frozen_string_literal: true

class UserContext
  include RoleHelper
  attr_reader :user, :session

  def initialize(user, session)
    @user = user
    @session = session
  end
end
