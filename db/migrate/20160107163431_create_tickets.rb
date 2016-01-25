class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user
      t.integer :count
      t.date :month
      t.boolean :locked, null: false, default: false
      t.timestamps null: false
    end
  end
end
