class CreateBasketballCourts < ActiveRecord::Migration[7.0]
  def change
    create_table :basketball_courts do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :court_type
      t.integer :number_players
      t.integer :user_id

      t.timestamps
    end
  end
end
