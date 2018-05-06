class Micropost < ApplicationRecord
  # 単一のmicropostは単一のuserにのみbelongs_toする
  belongs_to :user
  # content のバリデートルール 最長140バイト、必須
  validates :content, presence: true, length: { maximum: 140 }
end
