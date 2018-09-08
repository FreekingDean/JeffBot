class AddPosToEntry < ActiveRecord::Migration[4.2]
  def change
    add_column :entries, :part_of_speach, :string
  end
end
