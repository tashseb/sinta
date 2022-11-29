class AddProfilelinkToCandidate < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :profile, :string
  end
end
