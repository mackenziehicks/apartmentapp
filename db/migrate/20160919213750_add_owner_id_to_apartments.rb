class AddOwnerIdToApartments < ActiveRecord::Migration
  def change
    add_reference :apartments, :owner, index: true, foreign_key: true
  end
end
