require 'rails_helper'

describe 'Lectures API', type: :request do
  it 'returns all lectures' do
    create_lectures
    get '/api/v1/lectures'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(15)
  end
end
