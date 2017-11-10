class Bill < ApplicationRecord
  enum status: %i(unpaid paid accepted rejected)

  belongs_to :user

  has_many :bill_details, dependent: :destroy
end
