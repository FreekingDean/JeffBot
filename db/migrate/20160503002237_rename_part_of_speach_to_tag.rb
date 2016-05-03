class RenamePartOfSpeachToTag < ActiveRecord::Migration
  def change
    rename_column :entries, :part_of_speach, :tag
  end
end
