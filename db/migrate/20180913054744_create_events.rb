class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :event_category, foreign_key: true
      t.string :title
      t.string :location
      t.datetime :start_at
      t.integer :ticket_price
      t.integer :ticket_quantity

      t.timestamps
    end
  end
end
