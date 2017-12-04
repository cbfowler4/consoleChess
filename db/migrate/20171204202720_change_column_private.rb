class ChangeColumnPrivate < ActiveRecord::Migration[5.1]
  def change
    remove_column :goals, :private
    add_column :goals, :private_goal, :boolean
  end
end
