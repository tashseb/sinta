class AddDateToInterviews < ActiveRecord::Migration[7.0]
  def change
    add_column :interviews, :date, :datetime
  end
end
