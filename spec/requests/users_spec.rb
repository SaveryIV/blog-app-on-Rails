require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    before :each do
      get users_path
    end

    it 'returns as a successful response if status is correct' do
      expect(response).to be_successful
    end

    it 'returns as http status 200 or response status is correct' do
      expect(response.status).to eq(200)
    end

    it 'renders as the right view file and the correct template' do
      expect(response).to render_template(:index)
    end
  end

  context 'GET /show' do
    let(:valid_attributes) { { 'name' => 'Lily' } }
    let(:user) { User.create! valid_attributes }
    before :each do
      get user_url(user)
    end

    it 'returns as a successful response if status is correct' do
      expect(response).to be_successful
    end

    it 'returns as http status 200 or response status is correct' do
      expect(response.status).to eq(200)
    end

    it 'renders as the right view file and the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
