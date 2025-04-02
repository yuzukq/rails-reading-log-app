class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable,
         authentication_keys: [:user_name],
         case_insensitive_keys: [:user_name]

  # 関連付け
  has_many :book_notes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # バリデーション
  validates :user_name, presence: true, uniqueness: true

  # email認証を無効化
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
