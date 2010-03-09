class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
