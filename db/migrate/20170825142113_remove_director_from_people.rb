class RemoveDirectorFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :director, :boolean
  end
end
