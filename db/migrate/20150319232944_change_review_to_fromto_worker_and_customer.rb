class ChangeReviewToFromtoWorkerAndCustomer < ActiveRecord::Migration
  def change
  	rename_column :reviews, :to_id, :worker_id
    rename_column :reviews, :from_id, :customer_id
  end
end
