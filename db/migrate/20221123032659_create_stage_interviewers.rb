class CreateStageInterviewers < ActiveRecord::Migration[7.0]
  def change
    create_table :stage_interviewers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
