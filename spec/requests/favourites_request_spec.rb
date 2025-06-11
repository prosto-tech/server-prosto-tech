require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  let(:user) { FactoryBot.create(:user, username: 'acushla', password: 'password') }
  let(:item) do
    FactoryBot.create(:item, make: 'Karcher', model: 'WD 6 P S',
                            price: "100", user: user, desc: "some test item",
                            image_url: 'test')
  end

  describe 'POST /favourites' do
    it 'adds a item to list of favourites' do
      post '/api/v1/favourites', params: { item_id: item.id },
                                 headers: { 'Authorization' => AuthenticationTokenService.call(user.id) }

      expect(response).to have_http_status(:success)
      expect(json).to eq({
                           'message' => 'Успішно додано до вподобаних'
                         })
    end
  end
end
