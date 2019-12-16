class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.references :procedure, foreign_key: true
      t.date :date_work
      t.string :description
      t.string :next_work

      t.timestamps
    end
  end
end
