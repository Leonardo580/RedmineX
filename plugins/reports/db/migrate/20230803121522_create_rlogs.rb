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
  add_column :contracts, :low_progress, :integer, default: 0
  add_column :contracts, :normal_progress, :integer, default: 0
  add_column :contracts, :high_progress, :integer, default: 0
  add_column :contracts, :urgent_progress, :integer, default: 0
  add_column :contracts, :immediate_progress, :integer, default: 0
end
