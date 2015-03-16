class AddPriceToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :price, :decimal, :precision => 8, :scale => 2
  end
end
