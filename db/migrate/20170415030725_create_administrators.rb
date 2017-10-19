class CreateAdministrators < ActiveRecord::Migration[5.0]
  def up
    enable_extension 'uuid-ossp'
    create_table "administrators", id: :uuid, id: false, default: "uuid_generate_v4()", force: true do |t|
      t.uuid "id", default: "uuid_generate_v4()", null: false, unique: true
      t.string  "firstname", limit: 40, null: false
      t.string  "lastname",  limit: 40, null: false
      t.uuid    "user_id", default: "uuid_generate_v4()", null: false
	  
      t.timestamps
   end
    execute "ALTER TABLE administrators ADD PRIMARY KEY (id);"
    add_index "administrators", ["lastname", "firstname", "id"], name: "BY_LASTNAME", using: :btree
    add_index "administrators", ["user_id"], name: "fk_administrators_users_idx", using: :btree
  end

  def down
    drop_table :administrators
  end
end
