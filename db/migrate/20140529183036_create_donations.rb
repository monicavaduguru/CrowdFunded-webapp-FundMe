class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :kid_id
      t.integer :user_id
      t.datetime :donation_time
      t.decimal :amount

      t.timestamps
    end
  end
end
