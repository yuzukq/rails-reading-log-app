class BookNote < ApplicationRecord
  # 読書状況の定義
  enum :status, {  
    reading: 0,    # 読書中
    completed: 1,  # 完了
    suspended: 2   # 中断
  }

  # コメントの関連付け
  has_many :comments, dependent: :destroy  

  # バリデーション
  validates :title, presence: true
  validates :author, presence: true
  validates :status, presence: true
  validate :end_date_after_begin_date

  private

  def end_date_after_begin_date
    return if begin_date.blank? || end_date.blank?

    if end_date < begin_date
      errors.add(:end_date, "は開始日より後の日付である必要があります")
    end
  end
end