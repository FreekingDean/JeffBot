class CreateEntries < ActiveRecord::Migration[4.2]
  def up
    create_table :entries do |t|
      t.string :word
      t.string :definition
      t.integer :count
    end
  end

  def down
    drop_table :entries
  end
end
