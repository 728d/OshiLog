class CreateOshiLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :oshi_logs do |t|

      t.timestamps
    end
  end
end
