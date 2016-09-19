class RemoveApartmentIdFromOwners < ActiveRecord::Migration
  def change
    remove_column :owners, :apartment_id
  end
end
