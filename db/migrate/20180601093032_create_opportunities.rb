class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :title
      t.text :description
      t.date :post_date
      t.text :qualifications
      t.boolean :visa_sponsorship
      t.boolean :apartment_sponsership
      t.float :salary

      t.timestamps null: false
    end
  end
end
