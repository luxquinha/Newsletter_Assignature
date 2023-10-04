class CreateAssignatures < ActiveRecord::Migration[7.0]
  def change
    create_table :assignatures do |t|
      t.references :newsletter, null: false, foreign_key: true
      t.references :reader, null: false, foreign_key: true

      t.timestamps
    end
  end
end
