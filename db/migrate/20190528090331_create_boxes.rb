class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes do |t|
      t.string :description
      t.string :caracteristics
      t.string :address
      t.string :name
      t.integer :price_per_day
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
