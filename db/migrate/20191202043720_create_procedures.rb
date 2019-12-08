class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.string :patient
      t.string :doctor
      t.date :date_procedure
      t.string :sex
      t.string :city
      t.string :note
      t.string :last_procedure
      t.string :reason
      t.string :motivation
      t.string :drugs
      t.string :contraceptive
      t.string :anomaly
      t.string :bone_development
      t.string :physical_type
      t.string :height
      t.string :weight
      t.string :last_surgery
      t.string :cheers

      t.timestamps
    end
  end
end
