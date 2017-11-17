class ChangeRatingToBooksDefaultValue < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :rating, :float, default: 0
  end
end
