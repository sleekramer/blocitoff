class CreateSubitems < ActiveRecord::Migration
  def change
    create_table :subitems do |t|
      t.string :name
      t.references :item, index: true, foreign_key: true
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
