class ChangeColumnToLatitudeApartments < ActiveRecord::Migration
  def change
    rename_column :apartments, :lattitude, :latitude
  end
end
