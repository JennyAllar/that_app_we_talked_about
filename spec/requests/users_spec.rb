require 'rails_helper'

RSpec.describe '/users', type: :request do
  let!(:bob) { create(:user, name: 'Bob') }
  let!(:jane) { create(:user, name: 'Jane') }

  it 'creates returns all Users' do
    get '/users'

    body = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(body.size).to eq(2)
    expect(body.pluck('name')).to match_array(%w[Bob Jane])
    expect(User.count).to eq(2)
  end

  it 'creates a User' do
    post '/users', params: { user: { name: 'Harold', phone_number: '555-7777' } }

    body = JSON.parse(response.body)
    expect(response.status).to eq(200)
    expect(body['name']).to eq('Harold')
    expect(User.count).to eq(3)
  end
end
