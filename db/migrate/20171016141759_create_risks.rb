class CreateRisks < ActiveRecord::Migration[5.0]
  def up
    enable_extension 'uuid-ossp'
    create_table :risks, id: :uuid do |t|
      t.string :description, null: false
      t.string :name, null: false
      t.string :location, null: false
      t.string :interest_rate, null: false
      t.string :situation, null: false
      t.decimal :amount_covered,  precision: 10, scale: 2, null: false
      t.decimal :contribution,  precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
  def down
    drop_table :risks
  end
end
