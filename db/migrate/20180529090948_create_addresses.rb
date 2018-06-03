class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :address_3
      t.string :city
      t.string :state
      t.integer :zip
      t.references :resource, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
