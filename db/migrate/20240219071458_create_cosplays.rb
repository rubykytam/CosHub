class CreateCosplays < ActiveRecord::Migration[7.1]
  def change
    create_table :cosplays do |t|
      t.string :name
      t.string :source_material
      t.string :size
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
