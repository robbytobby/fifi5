# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :trackable, :validatable,
         :lockable, :timeoutable

  #validates_presence_of :username
  validates_uniqueness_of :username
end
