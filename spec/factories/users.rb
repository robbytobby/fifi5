# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" }
    email { "#{username}@test.org" }
    password 'VerySecret'
    password_confirmation 'VerySecret'
  end
end
