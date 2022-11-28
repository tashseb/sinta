class RemoveStatusFromCandidate < ActiveRecord::Migration[7.0]
  def change
    remove_column :candidates, :status, :string
  end
end
