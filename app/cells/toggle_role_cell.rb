# frozen_string_literal: true

class ToggleRoleCell < ApplicationCell
  attr_reader :role
  alias user model

  def show
    return unless role_policy.user?
    fragments.join
  end

  private

  def divider
    content_tag :div, '', class: 'dropdown-divider'
  end

  def fragments
    role_links.unshift(divider)
  end

  def role_links
    %w[user accountant admin].map do |role|
      next if forbidden?(role)
      @role = role
      render view: view_template
    end
  end

  def view_template
    controller.current_role.to_s == @role ? :show : :change
  end

  def role_policy
    RolePolicy.new(policy_context, :role)
  end

  def policy_context
    UserContext.new(controller.current_user, controller.session)
  end

  def forbidden?(role)
    !role_policy.send("#{role}?")
  end
end
