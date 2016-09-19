class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.timestamp :time
      t.integer :phone
      t.references :apartment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
