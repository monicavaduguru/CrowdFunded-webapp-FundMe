class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :kids, :money, :money_required
  end
end
