class Book < ApplicationRecord
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :bill_details, dependent: :destroy
  has_many :reading_histories, dependent: :destroy
end
