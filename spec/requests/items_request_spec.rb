require 'rails_helper'

RSpec.describe 'Items', type: :request do
  let(:user) { FactoryBot.create(:user, username: 'acushla', password: 'password') }

  describe 'GET /items' do
    before do
      FactoryBot.create(:item, make: 'Karcher', model: 'WD 6 P S',
                            price: "100", user: user, desc: "some test item",
                            image_url: 'test')
    end
    
    it 'returns error when there is no current logged in user' do
      get '/api/v1/items'

      expect(response).to have_http_status(:unauthorized)
      expect(json).to eq({
                           'error' => 'You will need to login first'
                         })
    end

    it 'returns all items' do
      get '/api/v1/items', headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }

      expect(response).to have_http_status(:success)
      expect(json.size).to eq(1)
    end
  end
end
