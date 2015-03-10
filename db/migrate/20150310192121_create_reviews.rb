class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :maker_id
    	t.integer :tasker_id
    	t.integer :assignment_id

    	t.integer :rating
    	t.text :comment

      t.timestamps null: false
    end
  end
end
