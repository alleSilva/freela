class CreateFreelancerProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :freelancer_profiles do |t|
      t.string :name
      t.string :social_name
      t.text :education
      t.date :birth_date
      t.text :description
      t.text :experience

      t.timestamps
    end
  end
end
