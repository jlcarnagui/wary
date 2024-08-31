# db/migrate/[timestamp]_create_logs.rb
class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :dni_or_license_plate
      t.string :entry_type
      t.datetime :timestamp
      t.string :client

      t.timestamps
    end
  end
end