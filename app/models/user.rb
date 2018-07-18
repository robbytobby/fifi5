# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :trackable, :validatable,
         :lockable, :timeoutable
end
