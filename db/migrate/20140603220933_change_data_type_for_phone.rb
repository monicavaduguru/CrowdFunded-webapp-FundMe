class ChangeDataTypeForPhone < ActiveRecord::Migration
  def change
    change_column :kids, :phone_number, :integer
  end
end
