class User < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :reading_histories, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :targetable_id,
    dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    dependent: :destroy
  has_many :interest_relationships, class_name: Relationship.name,
    foreign_key: :targetable_id,
    dependent: :destroy

  has_many :followings, through: :active_relationships,
    source: :targetable,
    source_type: User.name
  has_many :followers, through: :passive_relationships,
    source: :targetable,
    source_type: User.name
  has_many :interested_categories, through: :interest_relationships,
    source: :targetable,
    source_type: Category.name
end
