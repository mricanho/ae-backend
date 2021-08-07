require 'rails_helper'

describe 'Types API', type: :request do
  it 'returns all Lecture Types/Groups' do
    create_group(3)
    get '/api/v1/types'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(3)
  end
end
