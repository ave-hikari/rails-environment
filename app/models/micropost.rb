class Micropost < ApplicationRecord
  # 単一のmicropostは単一のuserにのみbelongs_toする
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  # content のバリデートルール 最長140バイト、必須
  validates :content, presence: true, length: { maximum: 140 }
end
