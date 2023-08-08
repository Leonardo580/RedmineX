class CreateRlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :rlogs do |t|
      t.references :contract, foreign_key: true
      t.references :journal, foreign_key: true, type: :integer
      t.integer :duration
      t.boolean :violated
    end
    add_index :rlogs, :contract_id
    add_index :rlogs, :journal_id
  end
end
