class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.string :name
      t.string :code
      t.text :description
      t.string :status
      t.datetime :started_at
      t.datetime :ended_at
      t.float :value
      t.references :leader
      t.references :project

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
