class Micropost < ApplicationRecord
  # 単一のmicropostは単一のuserにのみbelongs_toする
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  # content のバリデートルール 最長140バイト、必須
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  private
  # サイズチェック
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
