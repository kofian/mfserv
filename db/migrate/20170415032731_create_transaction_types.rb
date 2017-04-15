class CreateTransactionTypes < ActiveRecord::Migration[5.0]
  def up
     create_table "transaction_types", id: false, force: true do |t|
      t.integer "id", null: false
      t.string "name", limit: 30
     end
     execute "ALTER TABLE transaction_types ADD PRIMARY KEY (id);"
  end

  def down
    drop_table :transaction_types
  end
end
