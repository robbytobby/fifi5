# frozen_string_literal: true

class SetAdminAndAccountantOnUsers < ActiveRecord::Migration[5.2]
  class User < ApplicationRecord
    has_and_belongs_to_many :roles, join_table: :user_roles

    def role_names
      roles.map(&:name)
    end
  end

  class Role < ApplicationRecord
    has_and_belongs_to_many :users, join_table: :user_roles
  end

  def up
    User.all.each do |user|
      a = Address.find_by(user_id: user.id)
      user.admin = true if user.role_names.include?('admin')
      user.accountant = true if user.role_names.include?('accountant')
      user.email = a.email
      user.save
    end
  end

  def down; end
end
