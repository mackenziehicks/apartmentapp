class ChangePhoneToNumeric < ActiveRecord::Migration
  def change
    change_column :owners, :phone, :numeric
  end
end
