class CreateEquityTypes < ActiveRecord::Migration[5.0]
  def up
    create_table :equity_types do |t|
      t.string :name
      t.string :description
      t.string :status

      t.timestamps
    end
  end
  def down
    drop_table :equity_types
  end
end
