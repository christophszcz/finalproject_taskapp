class RemovePriceInCentsFromAssignments < ActiveRecord::Migration
  def change
    remove_column :assignments, :price_in_cents, :integer
  end
end