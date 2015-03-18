class ChangeReviewWorkerCustomerToFromAndTo < ActiveRecord::Migration
  def change
    rename_column :reviews, :worker_id, :from_id
    rename_column :reviews, :customer_id, :to_id
  end
end
