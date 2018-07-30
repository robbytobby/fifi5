# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject(:user) { build :user }

  it 'is valid' do
    expect(user).to be_valid
  end

  context 'the username' do
    it 'has to be present' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'has to be at least 4 characters long' do
      user.username = 'abc'
      expect(user).not_to be_valid
    end

    it 'has to be at most 50 characters long' do
      user.username = SecureRandom.base64(51)
      expect(user).not_to be_valid
    end

    it 'has to be uniqe' do
      create :user, username: 'chris'
      user.username = 'chris'
      expect(user).not_to be_valid
    end
  end

  context 'the email adress' do
    it 'has to be present' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'has to be less then 80 characters long' do
      twenty = 'abcdeabcdeabcdeabcde'
      user.email = "#{twenty}.#{twenty}.#{twenty}@abcdefghi.test.org"
      expect(user).not_to be_valid
    end

    it 'has to be in a valid format' do
      user.email = 'blub'
      expect(user).not_to be_valid
    end
  end
end
