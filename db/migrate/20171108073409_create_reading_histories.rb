class CreateReadingHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :reading_histories do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :mark_as

      t.timestamps
    end
  end
end
