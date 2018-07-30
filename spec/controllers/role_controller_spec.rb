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

  context 'with an user loged in' do
    before(:each) { user_sign_in }

    describe 'put #update role to accountant' do
      subject { put :update, params: { role: 'accountant' } }

      it 'returns http not_authorized' do
        expect { subject }.to raise_error(Pundit::NotAuthorizedError)
      end
    end

    describe 'put #update role to admin' do
      subject { put :update, params: { role: 'admin' } }

      it 'returns http not_authorized' do
        expect { subject }.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end

  context 'with an accountant loged in' do
    before(:each) { accountant_sign_in }

    describe 'put #update role to accountant' do
      subject { put :update, params: { role: 'accountant' } }

      it 'returns http success' do
        expect(subject).to have_http_status(:found)
      end

      it 'changes the current role to accountant' do
        subject
        expect(controller.current_role).to eq(:accountant)
      end
    end

    describe 'put #update role to admin' do
      subject { put :update, params: { role: 'admin' } }

      it 'returns http unauthorized' do
        expect { subject }.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end

  context 'with an admin loged in' do
    before(:each) { admin_sign_in }

    describe 'put #update role to accountant' do
      subject do
        put :update, params: { role: 'accountant' }
      end

      it 'returns http success' do
        expect(subject).to have_http_status(:found)
      end

      it 'sets the current role to accountant' do
        subject
        expect(controller.current_role).to eq(:accountant)
      end
    end

    describe 'put #update role to admin' do
      subject { put :update, params: { role: 'admin' } }

      it 'returns http success' do
        expect(subject).to have_http_status(:found)
      end

      it 'sets the current role to admin' do
        subject
        expect(controller.current_role).to eq(:admin)
      end
    end
  end
end
