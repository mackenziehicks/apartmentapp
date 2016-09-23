class RemoveOwnerIdFromApartments < ActiveRecord::Migration
  def change
    remove_column :apartments, :owner_id
  end
end
