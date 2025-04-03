class Comment < ApplicationRecord
  belongs_to :book_note
  belongs_to :user

  validates :page, presence: true, 
  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :impression, presence: true

end
