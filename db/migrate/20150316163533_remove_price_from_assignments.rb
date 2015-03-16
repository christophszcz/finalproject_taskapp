class RemovePriceFromAssignments < ActiveRecord::Migration
  def change
    remove_column :assignments, :price, :integer
  end
end