# frozen_string_literal: true

class DropTableRoles < ActiveRecord::Migration[5.2]
  def change
    drop_table 'roles', id: :serial, force: :cascade do |t|
      t.string 'name', limit: 255, null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index %w[name], name: 'index_roles_on_name', unique: true
    end

    drop_table 'user_roles', id: :serial, force: :cascade do |t|
      t.integer 'user_id', null: false
      t.integer 'role_id', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index %w[role_id], name: 'index_user_roles_on_role_id'
      t.index %w[user_id role_id], name: 'index_user_roles_on_user_id_and_role_id'
      t.index %w[user_id], name: 'index_user_roles_on_user_id'
    end
  end
end
