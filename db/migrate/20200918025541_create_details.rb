class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.date :deatailday,           null: false
      t.integer :purchase_id,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
