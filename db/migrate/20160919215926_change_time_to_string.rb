class ChangeTimeToString < ActiveRecord::Migration
  def change
    change_column :owners, :time, :text
  end
end
