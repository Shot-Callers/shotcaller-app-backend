class BasketballCourt < ApplicationRecord
    belongs_to :user
    validates :name, :address, :city, :state, :zip, :court_type, :number_players, presence: true
end
