class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.datetime :start_time,    null: false
      t.boolean :is_expenditure, null: false
      t.integer :cost,           null: false
      t.string :title,           null: false
      t.text :body
      t.timestamps
    end
  end
end
