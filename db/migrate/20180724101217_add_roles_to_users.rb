# frozen_string_literal: true

class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :users, :accountant, :boolean, null: false, default: false
  end
end
