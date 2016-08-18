class RenameColumnsInEntries < ActiveRecord::Migration
  def change
    rename_column :entries, :word, :gram_2
    rename_column :entries, :nword, :gram_1
    rename_column :entries, :definition, :word
  end
end
