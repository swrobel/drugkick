class CreateInquiriesReligions < ActiveRecord::Migration
  def self.up
    create_table :inquiries_religions, :id => false do |t|
      t.integer :inquiry_id
      t.integer :religion_id
    end
    
    add_index :inquiries_religions, [:inquiry_id, :religion_id], :unique => true
  end

  def self.down
    drop_table :inquiries_religions
  end
end
