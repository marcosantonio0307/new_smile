class AddStatusToProcedures < ActiveRecord::Migration[5.2]
  def change
    add_column :procedures, :status, :boolean
  end
end
