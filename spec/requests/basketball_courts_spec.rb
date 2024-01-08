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

  describe "POST /create" do 
    it 'should create a basketball court' do
        basketball_params = {
            basketball_court: {
              name: "Court 1", 
              address: "123 Happy Street", 
              city: "City One", 
              state: "State 1", 
              zip: 12345, 
              court_type: "indoor", 
              number_players: 5,
              user_id: user.id
            }
        }

        post '/basketball_courts', params: basketball_params
        expect(response).to have_http_status(200)

        basketball_court = BasketballCourt.first

        expect(basketball_court.name).to eq "Court 1"  
        expect(basketball_court.address).to eq "123 Happy Street"
        expect(basketball_court.city).to eq "City One"
        expect(basketball_court.state).to eq "State 1"
        expect(basketball_court.zip).to eq 12345
        expect(basketball_court.court_type).to eq "indoor"
        expect(basketball_court.number_players).to eq 5
    end

    it "cannot create an basketball_court without valid attributes" do 
        basketball_court_params = {
          basketball_court: {
          name: "", 
          address: "", 
          city: "", 
          state: "",
          zip: nil, 
          court_type: "", 
          number_players: nil
        }}

        post '/basketball_courts', params: basketball_court_params
        basketball_court = JSON.parse(response.body)
        expect(response).to have_http_status(422)
        expect(basketball_court['name']).to include "can't be blank"
        expect(basketball_court['address']).to include "can't be blank"
        expect(basketball_court['city']).to include "can't be blank"
        expect(basketball_court['state']).to include "can't be blank"
        expect(basketball_court['zip']).to include "can't be blank"
        expect(basketball_court['court_type']).to include "can't be blank"
        expect(basketball_court['number_players']).to include "can't be blank"
      end
  end
end
