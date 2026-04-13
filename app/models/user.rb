class User < ApplicationRecord
  has_many :todo_lists, dependent: :destroy
  has_many :tasks, through: :todo_lists

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
end
