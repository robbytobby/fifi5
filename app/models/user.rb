# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :trackable, :validatable,
         :lockable, :timeoutable

  validates :username, presence: true, uniqueness: true, length: { in: (4..50) }
  validates :email, presence: true, length: { maximum: 80 }, email: true
end
