class CoinAccount < ActiveRecord::Migration[5.0]
  def up
    enable_extension 'uuid-ossp'
    create_table :coin_accounts, id: :uuid do |t|
      t.string "bitcoin_acct",null: false
      t.uuid "customer_id",  null: false
      t.decimal "balance",    precision: 10, scale: 2, null: false
      t.datetime  "date_opened", null: false
      t.integer "acct_type_id", limit: 1,   null: false
      t.string "status", default:"active"
      
      t.timestamps
   end
   add_index "coin_accounts", ["acct_type_id"], name: "fk_coin_accounts_acct_types1_idx", using: :btree
   add_index "coin_accounts", ["customer_id"], name: "fk_coin_accounts_customers1_idx", using: :btree
   add_index "coin_accounts", ["bitcoin_acct"], name: "fk_coin_accounts_bitcoin_acct1_idx", using: :btree
  end
  def down
   drop_table :coin_accounts
  end
end
