class ReadingHistory < ApplicationRecord
  enum mark_as: %i(reading read favorite)

  ATTRIBUTE_PARAMS = %i(user_id book_id mark_as)

  belongs_to :user
  belongs_to :book
end
