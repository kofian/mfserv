class CreateCustomers < ActiveRecord::Migration[5.0]
  def up
   enable_extension 'uuid-ossp'
   create_table "customers", id: :uuid do |t|
       t.string  "phone1",    limit: 20
       t.string  "phone2",    limit: 20
       t.string  "title",     limit: 11
       t.string  "firstname", limit: 40
       t.string  "lastname",  limit: 40
       t.uuid    "user_id",  null: false, unique: true

      t.timestamps
    end
    add_index "customers", ["lastname", "firstname"], name: "NAME_LAST_FIRST", using: :btree
    add_index "customers", ["user_id"], name: "fk_customers_users1_idx", using: :btree
  end

  def down
    drop_table :customers
  end

end
