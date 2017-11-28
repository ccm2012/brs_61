class Review < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(user_id book_id rate content picture)

  scope :set_order, ->{order("created_at desc")}
  acts_as_votable

  belongs_to :user
  belongs_to :book

  has_many :comments, dependent: :destroy

  mount_uploader :picture, PictureUploader
  validates :content, presence: true
  validates :rate, presence: true
  validate :picture_size

  private

  def picture_size
    return unless picture.size > 5.megabytes
    errors.add(:picture, t("review_for.picture_size"))
  end
end
