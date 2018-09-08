class AddNwordToEntries < ActiveRecord::Migration[4.2]
  def change
    add_column :entries, :nword, :string
  end
end
