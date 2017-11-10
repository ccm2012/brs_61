class CreateBillDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_details do |t|
      t.references :bill, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :cost

      t.timestamps
    end
  end
end
