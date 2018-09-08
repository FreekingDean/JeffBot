class RenamePartOfSpeachToTag < ActiveRecord::Migration[4.2]
  def change
    rename_column :entries, :part_of_speach, :tag
  end
end
