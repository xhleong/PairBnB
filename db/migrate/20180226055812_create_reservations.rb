class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.integer :total_price

      t.references :user, foreign_key: true, index: true
      t.references :listing, foreign_key: true, index: true

      t.timestamps
    end
  end
end
