# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context 'without login' do
    subject { get :index }

    describe 'GET #index' do
      it 'returns http success' do
        expect(subject).to redirect_to('/users/sign_in')
      end
    end
  end

  context 'with a user loged in' do
    let(:user) { User.find_by(username: 'user') }
    subject { get :index }
    before(:each) { sign_in user }

    describe 'GET #index' do
      it 'returns http success' do
        expect(subject).to have_http_status(:ok)
      end

      it 'renders teh dashboard#index template' do
        expect(subject).to render_template(:index)
      end
    end
  end
end
