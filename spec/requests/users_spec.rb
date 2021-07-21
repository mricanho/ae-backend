require 'rails_helper'

describe 'POST /register - registration success', type: :request do
  let(:new_user) do
    {
      username: 'somebody',
      email: 'somebody@someone.com',
      password: '123456',
      password_confirmation: '123456'
    }
  end

  it 'creates a new user and logs it in' do
    post '/api/v1/register', params: new_user
    parsed_body = JSON.parse(response.body)
    expect(response).to have_http_status(:success)
    expect(parsed_body.keys).to match_array(%w[loggedIn username email admin token])
    expect(parsed_body['username']).to eq(new_user[:username])
    expect(parsed_body['email']).to eq(new_user[:email])
    expect(parsed_body['loggedIn']).to eq(true)
    expect(parsed_body['admin']).to eq(false)
  end
end
describe 'POST /register - registration missing password', type: :request do
  let(:without_password) do
    {
      username: 'somebody',
      email: 'somebody@someone.com'
    }
  end
  it 'fails and return error message' do
    post '/api/v1/register', params: without_password
    parsed_body = JSON.parse(response.body)

    expect(response).to have_http_status(:unprocessable_entity)
    expect(parsed_body.keys).to match_array(%w[error])
    expect(parsed_body['error']).to eq("Password can't be blank")
  end
end

describe 'POST /register - registration missing email', type: :request do
  let(:without_email) do
    {
      username: 'somebody',
      password: '123456',
      password_confirmation: '123456'
    }
  end

  it 'fails and return error message' do
    post '/api/v1/register', params: without_email
    parsed_body = JSON.parse(response.body)

    expect(response).to have_http_status(:unprocessable_entity)
    expect(parsed_body.keys).to match_array(%w[error])
    expect(parsed_body['error']).to eq("Email can't be blank")
  end
end

describe 'POST /register - registration missing username', type: :request do
  let(:without_username) do
    {
      email: 'somebody@someone.com',
      password: '123456',
      password_confirmation: '123456'
    }
  end
  it 'fails and return error message' do
    post '/api/v1/register', params: without_username
    parsed_body = JSON.parse(response.body)

    expect(response).to have_http_status(:unprocessable_entity)
    expect(parsed_body.keys).to match_array(%w[error])
    expect(parsed_body['error']).to eq("Username can't be blank")
  end
end

describe 'POST /register - registration username or email already exists', type: :request do
  let(:user) { create(:user) }

  it 'fails and return username error message' do
    post '/api/v1/register', params: { username: user.username, email: user.email, password: '123456' }
    parsed_body = JSON.parse(response.body)

    expect(response).to have_http_status(:unprocessable_entity)
    expect(parsed_body.keys).to match_array(%w[error])
    expect(parsed_body['error']).to eq('Username has already been taken')
  end

  it 'fails and return email error message' do
    post '/api/v1/register', params: { username: 'somebody', email: user.email, password: '123456' }
    parsed_body = JSON.parse(response.body)

    expect(response).to have_http_status(:unprocessable_entity)
    expect(parsed_body.keys).to match_array(%w[error])
    expect(parsed_body['error']).to eq('Email has already been taken')
  end
end
