class CreateOshiLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :oshi_logs do |t|
      t.integer :customer_id,  null: false
      t.string  :oshi_name,    null: false
      t.text    :body,         null: false
      t.string  :tag,          null: false
      t.boolean :is_published, null: false, default: true
      t.timestamps
    end
  end
end
