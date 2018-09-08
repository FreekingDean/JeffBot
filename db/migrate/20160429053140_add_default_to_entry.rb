class AddDefaultToEntry < ActiveRecord::Migration[4.2]
  def change
    change_column :entries, :count, :integer, default: 0
  end
end
