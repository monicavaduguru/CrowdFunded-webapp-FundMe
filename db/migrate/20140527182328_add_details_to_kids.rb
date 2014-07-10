class AddDetailsToKids < ActiveRecord::Migration
  def change
    add_column :kids, :address, :string
    add_column :kids, :money_received, :decimal, default: 0
  end
end
