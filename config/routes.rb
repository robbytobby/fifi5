# frozen_string_literal: true

Rails.application.routes.draw do
  put 'role/update'
  devise_for :users, skip: %i[registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users' => 'devise/registrations#update', as: 'user_registration'
  end
  get 'dashboard/index'

  root to: 'dashboard#index'
end
