class BasketballCourtsController < ApplicationController
    def index
        basketball_courts = BasketballCourt.all
        render json: basketball_courts
    end
end
