class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :comment
      t.references :activity, index: true

      t.timestamps null: false
    end
    add_foreign_key :entries, :activities
  end
end
