class AddNextFlgToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :next_flg, :boolean
  end
end
