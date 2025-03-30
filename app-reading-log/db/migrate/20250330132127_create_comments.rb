class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.integer :page, null: false
      t.text :impression, null: false
      t.references :book_note, null: false, foreign_key: true

      t.timestamps
    end
  end
end