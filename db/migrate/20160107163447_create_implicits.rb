class CreateImplicits < ActiveRecord::Migration
  def change
    create_table :implicits do |t|
      t.date :month, null: false
      t.integer :count, null: false
      t.timestamps null: false
    end
  end
end
