class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :category, foreign_key: true
      t.string :title
      t.string :author
      t.datetime :date_published
      t.text :summary
      t.text :description
      t.text :content
      t.float :rating
      t.integer :price
      t.string :picture

      t.timestamps
    end
  end
end
