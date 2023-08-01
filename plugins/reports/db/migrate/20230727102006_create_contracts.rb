class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.references :project
      t.integer :low
      t.integer :normal
      t.integer :high
      t.integer :urgent
      t.integer :immediate
    end
  end
end
