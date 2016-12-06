require 'rails_helper'

RSpec.feature 'Login is required for any Action' do
  scenario '- application root /' do
    visit ''
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_text('Log in')
  end
end
