class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :age
      t.string :purpose
      t.decimal :money
      t.string :comments
      t.string :image_url
      t.string :string

      t.timestamps
    end
  end
end
