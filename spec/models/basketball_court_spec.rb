require 'rails_helper'

RSpec.describe BasketballCourt, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password',
    skill_level: 1
    )
  }
  it 'should validate street' do
    attributes = [:name, :address, :city, :state, :zip, :court_type, :number_players]
    basketball_court = user.basketball_courts.create()
    attributes.each do |attr|
      expect(basketball_court.errors[attr]).to include("can't be blank")
    end
  end
end
