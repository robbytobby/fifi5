# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoleController, type: :controller do
  context 'without login' do
    subject { put :update, params: { role: 'admin' } }

    describe 'put #update' do
      it 'redirects to login page' do
        expect(subject).to redirect_to('/users/sign_in')
      end
    end
  end

  context 'with an admin loged in' do
    let(:user) { User.find_by(username: 'admin') }
    subject { put :update, params: { role: 'admin' } }
    before(:each) { sign_in user }

    describe 'put #update role to admin' do
      it 'returns http success' do
        expect(subject).to have_http_status(:ok)
      end

      it 'sets the current role to admin' do
        expect(controller.current_role).to eq(:admin)
      end
    end
  end
end
