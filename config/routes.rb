# frozen_string_literal: true

Rails.application.routes.draw do
  put 'role/update'
  devise_for :users
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'
end
