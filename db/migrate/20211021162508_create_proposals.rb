class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.decimal :payment_hour
      t.integer :week_hours
      t.date :conclusion_date
      t.text :resume
      t.references :project, null: false, foreign_key: true
      t.references :project_owner, null: false, foreign_key: true
      t.references :freelancer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
