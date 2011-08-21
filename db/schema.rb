# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110821045241) do

  create_table "drugs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drugs_inquiries", :id => false, :force => true do |t|
    t.integer "drug_id"
    t.integer "inquiry_id"
  end

  add_index "drugs_inquiries", ["drug_id", "inquiry_id"], :name => "index_drugs_inquiries_on_drug_id_and_inquiry_id", :unique => true

  create_table "drugs_rehabs", :id => false, :force => true do |t|
    t.integer "drug_id"
    t.integer "rehab_id"
  end

  add_index "drugs_rehabs", ["drug_id", "rehab_id"], :name => "index_drugs_rehabs_on_drug_id_and_rehab_id", :unique => true

  create_table "inquiries", :force => true do |t|
    t.string   "zip"
    t.string   "gender"
    t.integer  "age"
    t.boolean  "repeat"
    t.decimal  "price_min"
    t.decimal  "price_max"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "ip"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries_insurers", :id => false, :force => true do |t|
    t.integer "inquiry_id"
    t.integer "insurer_id"
  end

  add_index "inquiries_insurers", ["inquiry_id", "insurer_id"], :name => "index_inquiries_insurers_on_inquiry_id_and_insurer_id", :unique => true

  create_table "inquiries_religions", :id => false, :force => true do |t|
    t.integer "inquiry_id"
    t.integer "religion_id"
  end

  add_index "inquiries_religions", ["inquiry_id", "religion_id"], :name => "index_inquiries_religions_on_inquiry_id_and_religion_id", :unique => true

  create_table "inquiries_treatment_types", :id => false, :force => true do |t|
    t.integer "inquiry_id"
    t.integer "treatment_type_id"
  end

  add_index "inquiries_treatment_types", ["inquiry_id", "treatment_type_id"], :name => "index_inquiries_treatment_types", :unique => true

  create_table "insurers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurers_rehabs", :id => false, :force => true do |t|
    t.integer "insurer_id"
    t.integer "rehab_id"
  end

  add_index "insurers_rehabs", ["insurer_id", "rehab_id"], :name => "index_insurers_rehabs_on_insurer_id_and_rehab_id", :unique => true

  create_table "leads", :force => true do |t|
    t.integer  "inquiry_id"
    t.integer  "rehab_id"
    t.decimal  "price"
    t.boolean  "purchased"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leads", ["inquiry_id", "rehab_id"], :name => "index_leads_on_inquiry_id_and_rehab_id", :unique => true

  create_table "rehabs", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "url"
    t.string   "email"
    t.decimal  "avg_cost"
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rehabs_religions", :id => false, :force => true do |t|
    t.integer "rehab_id"
    t.integer "religion_id"
  end

  add_index "rehabs_religions", ["rehab_id", "religion_id"], :name => "index_rehabs_religions_on_rehab_id_and_religion_id", :unique => true

  create_table "rehabs_treatment_types", :id => false, :force => true do |t|
    t.integer "rehab_id"
    t.integer "treatment_type_id"
  end

  add_index "rehabs_treatment_types", ["rehab_id", "treatment_type_id"], :name => "index_rehabs_treatment_types_on_rehab_id_and_treatment_type_id", :unique => true

  create_table "religions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "treatment_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
