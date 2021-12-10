class CreateActuationAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :actuation_areas do |t|
      t.string :name
      t.references :freelancer_profiles, :actuation_area, null: false, foreign_key: true
      t.index [:name, :freelancer_profile_id], unique: true
    
      t.timestamps
    end
  end
end
