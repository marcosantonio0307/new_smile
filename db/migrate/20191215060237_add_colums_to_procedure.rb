class AddColumsToProcedure < ActiveRecord::Migration[5.2]
  def change
    add_column :procedures, :report, :string
    add_column :procedures, :tooth, :text
  end
end
