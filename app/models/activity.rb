class Activity < ApplicationRecord
  enum action: %i(review comment mark_as)

  belongs_to :user
  belongs_to :objectable, polymorphic: true
  belongs_to :targetable, polymorphic: true
end
