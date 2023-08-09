class CreateRlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :rlogs do |t|
      t.references :contract, foreign_key: true
      t.references :issue
      t.integer :duration
      t.boolean :violated
    end
    add_index :rlogs, :contract_id
    add_index :rlogs, :issue_id
  end
end
