class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.date :date_recipe

      t.timestamps
    end
  end
end
