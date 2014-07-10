class AddMoneyToKids < ActiveRecord::Migration
  def change
    add_column :kids, :money_needed, :decimal
  end
end
