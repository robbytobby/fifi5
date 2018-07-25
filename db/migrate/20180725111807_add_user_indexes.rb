# frozen_string_literal: true

class AddUserIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :users, ['email']
    add_index :users, ['reset_password_token'], unique: true
    add_index :users, ['unlock_token'], unique: true
    add_index :users, ['username'], unique: true
  end
end
