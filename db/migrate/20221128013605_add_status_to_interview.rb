class AddStatusToInterview < ActiveRecord::Migration[7.0]
  def change
    add_column :interviews, :status, :string
  end
end
