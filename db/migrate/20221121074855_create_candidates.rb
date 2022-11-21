class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :status
      t.references :stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
