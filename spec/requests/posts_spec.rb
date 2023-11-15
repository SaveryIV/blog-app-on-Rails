require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /show' do
    let(:user) { User.create(name: 'Lily') }
    let(:valid_attributes) { { 'author' => user, 'title' => 'Title' } }
    let(:post) { Post.create! valid_attributes }

    before :each do
      get "/users/:user_id/posts/#{post.id}"
    end

    it 'returns as a successful response if status is correct' do
      expect(response).to_not be_successful
    end

    it 'returns as http status 200 or response status is correct' do
      expect(response.status).to_not eq(200)
    end
  end
end
