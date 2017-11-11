class Relationship < ApplicationRecord
  enum action: %i(follow interested)

  belongs_to :user
  belongs_to :targetable, polymorphic: true
end
