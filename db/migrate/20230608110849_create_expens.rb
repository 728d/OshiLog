class CreateExpens < ActiveRecord::Migration[6.1]
  def change
    create_table :expens do |t|

      t.timestamps
    end
  end
end
