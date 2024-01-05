user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password", skill_level: "beginner")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password", skill_level: "advanced")

user1_basketball_courts = [
    {name: "Court 1", address: "123 Happy Street", city: "City One", state: "State 1", zip: 12345, court_type: "indoor", number_players: 5},
    {name: "Court 2", address: "321 Yep Rd", city: "City Two", state: "State 2", zip: 12346, court_type: "outdoor", number_players: 0},
]

user2_basketball_courts = [
    {name: "Court 100", address: "567 My Lane", city: "City 1", state: "State 3",  zip: 12349, court_type: "indoor", number_players: 10},
    {name: "Court 200", address: "789 Your Rd", city: "City 2", state: "State 4", zip: 12348, court_type: "outdoor", number_players: 4},
]

user1_basketball_courts.each do |court| 
    user1.basketball_courts.create(court);
    p "Created: #{court}"
end

user2_basketball_courts.each do |court| 
    user2.basketball_courts.create(court);
    p "Created: #{court}"
end
