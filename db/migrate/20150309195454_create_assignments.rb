class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :customer_id
      t.integer :worker_id
      t.text :description
      t.integer :price_in_cents
      t.datetime :date
      t.datetime :time
      t.string :title

      t.timestamps null: false
    end
  end
end
