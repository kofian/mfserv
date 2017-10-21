class CreateEquities < ActiveRecord::Migration[5.0]
  def up
    enable_extension 'uuid-ossp'
    create_table :equities, id: :uuid do |t|
      t.uuid :customer_id, null: false, index: true
      t.uuid :risk_id, null: false, index: true
      t.string :certificate_number, null: false
      t.string :issue_date
      t.string :equity_type_id
      t.daterange :equity_period
      t.string :bill_currency, null: false
      t.string :agency_code
      t.string :passport_number, null: false
      t.string :profession
      t.string :location_of_risk, null: false
      t.string :situation_of_risk, null: false
      t.string :ref_bank, null: false
      t.integer :ref_account, null: false
      t.string :ref_bank_branch, null: false
      t.string :interest_rate_type, null: false
    end
    add_index "equities", ["customer_id","risk_id","passport_number"], name: "fk_equities_owners1_idx", using: :btree
  end
  def down
    drop_table :equities
  end
end
