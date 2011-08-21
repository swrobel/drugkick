class AddPriceRangeToInquiries < ActiveRecord::Migration
  def self.up
    add_column :inquiries, :price_range, :string
  end

  def self.down
    remove_column :inquiries, :price_range
  end
end
