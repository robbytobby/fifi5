# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build :user }

  it 'is valid' do
    expect(user).to be_valid
  end

  %w[username password email].each do |attr|
    it "is not valid without #{attr}" do
      user.send("#{attr}=", nil)
      expect(user).not_to be_valid
    end
  end

  it 'is not valid if username is not uniq' do
    create :user, username: 'chris'
    user.username = 'chris'
    expect(user).not_to be_valid
  end
end
