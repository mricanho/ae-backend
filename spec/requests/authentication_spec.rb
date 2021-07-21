require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /login #Users' do
    let(:user) { create(:user) }

    it 'authenticates user with username and password' do
      post '/api/v1/login', params: { authentication: { username: user.username, password: user.password } }
      parsed_body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(parsed_body.keys).to match_array(%w[loggedIn username email admin token])
      expect(parsed_body['username']).to eq(user.username)
      expect(parsed_body['email']).to eq(user.email)
      expect(parsed_body['loggedIn']).to eq(true)
      expect(parsed_body['admin']).to eq(false)
    end

    it 'authenticates user with email and password' do
      post '/api/v1/login', params: { authentication: { email: user.email, password: user.password } }
      parsed_body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(parsed_body.keys).to match_array(%w[loggedIn username email admin token])
      expect(parsed_body['username']).to eq(user.username)
      expect(parsed_body['email']).to eq(user.email)
      expect(parsed_body['loggedIn']).to eq(true)
      expect(parsed_body['admin']).to eq(false)
    end

    it 'authentication fails' do
      post '/api/v1/login', params: { authentication: { email: user.email, password: 'sarasa' } }
      parsed_body = JSON.parse(response.body)

      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body.keys).to match_array(['error'])
      expect(parsed_body['error']).to eq('Incorrect password, username or e-mail.')
    end
  end
end

describe 'Authentication', type: :request do
  describe 'POST /login #Admin' do
    let(:admin_user) { create(:admin_user) }

    it 'authenticates admin with email and password' do
      post '/api/v1/login', params: { authentication: { email: admin_user.email, password: admin_user.password } }
      parsed_body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(parsed_body.keys).to match_array(%w[loggedIn username email admin token])
      expect(parsed_body['username']).to eq(admin_user.username)
      expect(parsed_body['email']).to eq(admin_user.email)
      expect(parsed_body['loggedIn']).to eq(true)
      expect(parsed_body['admin']).to eq(true)
    end

    it 'authenticates admin with username and password' do
      post '/api/v1/login', params: { authentication: { username: admin_user.username, password: admin_user.password } }
      parsed_body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(parsed_body.keys).to match_array(%w[loggedIn username email admin token])
      expect(parsed_body['username']).to eq(admin_user.username)
      expect(parsed_body['email']).to eq(admin_user.email)
      expect(parsed_body['loggedIn']).to eq(true)
      expect(parsed_body['admin']).to eq(true)
    end

    it 'authentication fails' do
      post '/api/v1/login', params: { authentication: { email: 'sarasa', password: 'sarasa' } }
      parsed_body = JSON.parse(response.body)

      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body.keys).to match_array(['error'])
      expect(parsed_body['error']).to eq('Incorrect password, username or e-mail.')
    end
  end
end
