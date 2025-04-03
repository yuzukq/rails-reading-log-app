class CreateBooknotes < ActiveRecord::Migration[8.0]
  def change
    create_table :book_notes do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :status, default: 0, null: false  
      t.date :begin_date
      t.date :end_date
      t.text :content

      t.timestamps
    end
  end
end