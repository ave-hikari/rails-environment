class User < ApplicationRecord
  # 1ユーザにつき複数のmicropostsが存在する
  has_many :microposts
  before_save { self.email = email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: true

  # Railsのメソッド
  # セキュアにハッシュ化したパスワードを、データベース内のpassword_digestという属性に保存できるようになる
  has_secure_password
end
