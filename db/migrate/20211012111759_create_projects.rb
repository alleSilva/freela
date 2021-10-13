class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :skills
      t.decimal :max_payment_hour
      t.boolean :remote
      t.date :limit_bid_date

      t.timestamps
    end
  end
end
