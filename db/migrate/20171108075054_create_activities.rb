class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.integer :action
      t.references :objectable, polymorphic: true
      t.references :targetable, polymorphic: true

      t.timestamps
    end
  end
end
