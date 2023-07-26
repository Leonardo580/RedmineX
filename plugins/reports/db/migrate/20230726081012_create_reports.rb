class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.boolean :failed_to_res
      t.boolean :failed_to_fix
    end
  end
end
