class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
