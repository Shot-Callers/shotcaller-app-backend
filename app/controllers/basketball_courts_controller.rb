class BasketballCourtsController < ApplicationController
        def index
            basketball_courts = BasketballCourt.all
            render json: basketball_courts
        end
        def create
            basketball_court = BasketballCourt.create(basketball_params)
            if basketball_court.valid?
                render json: basketball_court
            else
                render json: basketball_court.errors, status: 422
            end
        end
        def update
            basketball_court = BasketballCourt.find(params[:id])
            basketball_court.update(basketball_params)
                if basketball_court.valid?
                    render json: basketball_court
                else
                    render json: basketball_court.errors, status: 422
            end
        end
        def destroy
            basketball_court = BasketballCourt.find(params[:id])
            if basketball_court.destroy
                render json: basketball_court
            else
                render json: basketball_court.errors, status: 422
            end
        end
        private
        def basketball_params
            params.require(:basketball_court).permit(:name, :address, :city, :state, :zip, :court_type, :number_players, :user_id)
    end
end
