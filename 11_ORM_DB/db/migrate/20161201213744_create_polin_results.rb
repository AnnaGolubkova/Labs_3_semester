class CreatePolinResults < ActiveRecord::Migration[5.0]
  def change
    create_table :polin_results do |t|
      t.text :decimal
      t.text :result

      t.timestamps
    end
  end
end
