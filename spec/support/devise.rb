# frozen_string_literal: true

module LoginHelpers
  def admin_sign_in
    sign_in User.find_by(username: 'admin')
  end

  def accountant_sign_in
    sign_in User.find_by(username: 'accountant')
  end

  def user_sign_in
    sign_in User.find_by(username: 'user')
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include LoginHelpers, type: :controller
  config.include LoginHelpers, type: :view
end
