class AddPosToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :part_of_speach, :string
  end
end
