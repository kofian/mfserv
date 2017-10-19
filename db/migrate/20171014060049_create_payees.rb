class CreatePayees < ActiveRecord::Migration[5.0]
  def up
    create_table :payees, id: false, force: true do |t|
      t.string :ref_name
      t.string :bank_name, null: false
      t.string :routing_number
      t.string :swift_code
      t.string :address, null: false
      t.integer :acct_number, limit: 8, null: false
      t.string :status, default:"active"
      t.string :city, null: false
      t.string :state
      t.string :country, null: false
      t.string :post_code, null: false
      t.string :phone
      t.integer :acct_transaction_id, limit: 8, null: false
      t.string :payee_type, default:"credit"

      t.timestamps
    end
    execute "ALTER TABLE payees ADD PRIMARY KEY (acct_number);"
    add_index "payees", ["acct_number"], name: "fk_payees_acct_number1_idx", using: :btree
    add_index "payees", ["acct_transaction_id"], name: "fk_payees_acct_transaction1_idx", using: :btree
    add_index "payees", ["payee_type"], name: "fk_payees_payee_type1_idx", using: :btree
    add_index "payees", ["bank_name"], name: "fk_payees_bank_name1_idx", using: :btree
  end
  def down
   drop_table :payees
  end
end
