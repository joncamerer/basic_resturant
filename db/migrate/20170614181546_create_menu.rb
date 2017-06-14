class CreateMenu < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :category
      t.string :name
      t.text :description
      t.string :price
      t.timestamps
    end
  end
end
