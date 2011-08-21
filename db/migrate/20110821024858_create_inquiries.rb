class CreateInquiries < ActiveRecord::Migration
  def self.up
    create_table :inquiries do |t|
      t.string :zip
      t.string :gender
      t.integer :age
      t.boolean :repeat
      t.decimal :price_min
      t.decimal :price_max
      t.string :name
      t.string :phone
      t.string :email
      t.string :ip
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :inquiries
  end
end
