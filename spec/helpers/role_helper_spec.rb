# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoleHelper, type: :helper do
  describe 'current_role' do
    it 'is user per default' do
      expect(helper.current_role).to eq :user
    end

    it 'is accountant' do
      session[:current_role] = :accountant
      expect(helper.current_role).to eq :accountant
    end

    it 'is admin' do
      session[:current_role] = :admin
      expect(helper.current_role).to eq :admin
    end
  end
end
