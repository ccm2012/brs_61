class Book < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(category_id title author date_published summary
    description content price picture)

  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :bill_details, dependent: :destroy
  has_many :reading_histories, dependent: :destroy

  validates :author, presence: true,
    length: {maximum: Settings.max_length.name}
  validates :content, presence: true
  validates :summary, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.max_length.title}
end
