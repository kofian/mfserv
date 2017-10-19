class CreateEquities < ActiveRecord::Migration[5.0]
  def up
    enable_extension 'uuid-ossp'
    create_table :equities, id: :uuid do |t|
      t.uuid :customer_id, null: false, index: true
      t.uuid :risk_id, null: false, index: true
      t.string :certificat_number
      t.string :issue_date
      t.string :equity_type_id
      t.daterange :equity_period
      t.string :bill_currency
      t.string :agency_code
      t.string :passport_number
      t.string :profession

      t.timestamps
    end
  end
  def down
    drop_table :equities
  end
end
