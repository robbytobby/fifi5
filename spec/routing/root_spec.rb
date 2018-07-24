# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'root path' do
  it 'routes to dashboard index' do
    expect(get('/')).to route_to('dashboard#index')
  end
end
