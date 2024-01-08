# Shot Caller Backend App


# Controller

        def destroy
            basketball_court = BasketballCourt.find(params[:id])
            if basketball_court.destroy
                render json: basketball_court
            else
                render json: basketball_court.errors, status: 422
            end
                    end

# Spec.rb

  describe "DELETE /destroy" do 
    it "deletes a basketball court" do 
      basketball_params = {
        basketball_court: {
          name: "Court 1", 
          address: "123 Happy Street", 
          city: "City One", 
          state: "State 1", 
          zip: 123, 
          court_type: "outdoor", 
          number_players: 5, 
          user_id: user.id
        }
      }

      post '/basketball_courts', params: basketball_params

      basketball_court = BasketballCourt.first 

      delete "/basketball_courts/#{basketball_court.id}"

      expect(response).to have_http_status(200)
      basketball_courts = BasketballCourt.all 
      expect(basketball_courts).to be_empty
    end
  end
end