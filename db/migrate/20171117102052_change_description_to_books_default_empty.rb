class ChangeDescriptionToBooksDefaultEmpty < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :description, :text, default: ""
  end
end
