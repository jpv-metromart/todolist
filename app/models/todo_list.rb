class TodoList < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
end
