class ChangeDataTypeForPhonenumber < ActiveRecord::Migration
  def change
    change_column :users, :phonenumber, :integer
  end
end
