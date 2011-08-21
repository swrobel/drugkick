class CreateRehabs < ActiveRecord::Migration
  def self.up
    create_table :rehabs do |t|
      t.string :name
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :url
      t.string :email
      t.decimal :avg_cost
      t.integer :min_age
      t.integer :max_age
      t.string :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :rehabs
  end
end
