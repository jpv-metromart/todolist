class Task < ApplicationRecord
  belongs_to :todo_list
  has_one :user, through: :todo_list

  validates :description, presence: true
end
