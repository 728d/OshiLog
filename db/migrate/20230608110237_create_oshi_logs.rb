class CreateOshiLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :oshi_logs do |t|
      t.string  :oshi_name,    null: false
      t.text    :body,         null: false
      t.string  :tag,          null: false
      t.boolean :is_published, null: false, default: false
      t.timestamps
    end
  end
end
