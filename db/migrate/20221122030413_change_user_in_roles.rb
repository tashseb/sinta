class ChangeUserInRoles < ActiveRecord::Migration[7.0]
  def change
    remove_reference :roles, :user
    add_reference :roles, :user, required: false
  end
end
