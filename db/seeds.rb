user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password", skill_level: 1)
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password", skill_level: 3)

user1_basketball_courts = [
    {name: "Old Town Court", address: "2811 Jackson St", city: "San Diego", state: "CA", zip: 92110, court_type: "outdoor", number_players: 5},
    {name: "Santa Clara Point Court", address: "1008 Santa Clara PI", city: "San Diego", state: "CA", zip: 92109, court_type: "outdoor", number_players: 0},
]

user2_basketball_courts = [
    {name: "Court Social", address: "Av. Aquiles Serdan 639, Libertad", city: "Tijuana, B.C", state: "MX",  zip: 22400, court_type: "indoor", number_players: 10},
    {name: "Ocean Beach Athletic Area Robb Field", address: "2525 Bacon St", city: "San Diego", state: "Ca", zip: 92107, court_type: "outdoor", number_players: 4},
]

user1_basketball_courts.each do |court| 
    user1.basketball_courts.create(court);
    p "Created: #{court}"
end

user2_basketball_courts.each do |court| 
    user2.basketball_courts.create(court);
    p "Created: #{court}"
end
