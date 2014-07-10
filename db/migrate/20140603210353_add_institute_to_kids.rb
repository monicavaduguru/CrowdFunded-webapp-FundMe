class AddInstituteToKids < ActiveRecord::Migration
  def change
    add_column :kids, :donation_time, :datetime
    add_column :kids, :institute, :string
    add_column :kids, :phone_number, :decimal
  end
end
