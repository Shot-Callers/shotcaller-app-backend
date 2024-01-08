require 'rails_helper'

RSpec.describe "BasketballCourts", type: :request do
    let(:user) { User.create(
      email: "test1@example.com",
      password: "password", 
      password_confirmation: "password", 
      skill_level: 1
    )
  }

  describe "GET /index" do
    it 'gets a list of basketball courts' do
      basketball_court = user.basketball_courts.create(
        name: "Court 1", 
        address: "123 Happy Street", 
        city: "City One", 
        state: "State 1", 
        zip: 12345, 
        court_type: "indoor", 
        number_players: 5
      )
      get '/basketball_courts'

      basketball_court = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(basketball_court.first['name']).to eq('Court 1')
      expect(basketball_court.first['address']).to eq('123 Happy Street')
      expect(basketball_court.first['zip']).to eq(12345)
    end
  end
end
