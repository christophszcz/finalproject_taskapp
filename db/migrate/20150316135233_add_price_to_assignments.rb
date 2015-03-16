class AddPriceToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :price, :integer
  end
end