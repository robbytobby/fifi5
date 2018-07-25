# frozen_string_literal: true

class AdjustUserTable < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :username, :string, null: false, limit: 50, unique: true, case_sensitive: false, index: :unique
    change_column :users, :sign_in_count, :integer, null: false, default: 0
    change_column :users, :failed_attempts, :integer, null: false, default: 0
    add_column :users, :email, :string, null: false, limit: 80
    add_column :users, :admin, :boolean, null: false, default: false
    add_column :users, :accountant, :boolean, null: false, default: false
    remove_column :users, :confirmation_token
    remove_column :users, :confirmation_sent_at
    remove_column :users, :confirmed_at
    remove_column :users, :unconfirmed_email
  end

  def down
    change_column :users, :username, :string, null: false, default: ''
    change_column :users, :sign_in_count, :integer, default: 0
    change_column :users, :failed_attempts, :integer, default: 0
    remove_column :users, :email
    remove_column :users, :admin
    remove_column :users, :accountant
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :confirmed_at, :datetime
    add_column :users, :unconfirmed_email, :string
  end
end
