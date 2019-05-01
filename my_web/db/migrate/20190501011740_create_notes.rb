class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :genre
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
