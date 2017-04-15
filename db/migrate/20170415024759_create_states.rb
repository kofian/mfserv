class CreateStates < ActiveRecord::Migration[5.0]
  def up
     create_table "states", force: true do |t|
      t.string "name",         limit: 30, null: false
      t.string "abbreviation", limit: 5,  null: false
      t.string "assoc_press",  limit: 14, null: false
     end

    add_index "states", ["name", "id"], name: "BY_NAME", using: :btree
  end

  def down
    drop_table :states
  end
end
