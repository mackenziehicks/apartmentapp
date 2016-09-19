class AddLattitudeToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :lattitude, :float
  end
end
