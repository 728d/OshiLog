class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :customer_id,  null: false
      t.datetime :start_time,  null: false
      t.string   :event_title, null: false
      t.text     :event_body,  null: false
      t.timestamps
    end
  end
end
