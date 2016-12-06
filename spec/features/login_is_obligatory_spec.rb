require 'rails_helper'

RSpec.feature 'Login is required for any Action' do
  scenario 'requests root' do
    visit ''
    expect(current_path).to eq '/login'
    expect(page).to have_text('Login')
  end
end
