class Relationship < ApplicationRecord
  enum action: %(follow interested)

  belongs_to :user
  belongs_to :targetable, polymorphic: true
end
