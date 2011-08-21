class CreateInsurers < ActiveRecord::Migration
  def self.up
    create_table :insurers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :insurers
  end
end
