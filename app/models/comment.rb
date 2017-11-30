class Comment < ApplicationRecord
  ATTRIBUTE_PARAMS = %i(user_id review_id content picture)

  scope :set_order, ->{order("created_at desc")}

  belongs_to :user
  belongs_to :review

  mount_uploader :picture, PictureUploader
  validates :content, presence: true
  validate :picture_size

  private

  def picture_size
    return unless picture.size > 5.megabytes
    errors.add(:picture, t("review_for.picture_size"))
  end
end
