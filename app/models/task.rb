class Task < ApplicationRecord
  belongs_to :todo_list
  has_one :user, through: :todo_list

  validates :description, presence: true
  validates :todo_list_id, presence: true
  validates :completed, inclusion: { in: [true, false] }

  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :overdue, -> { where(completed: false).where("due_date < ?", Time.current) }
  scope :due_today, -> { where(due_date: Time.current.end_of_day) }
  scope :due_this_week, -> { where(due_date: Time.current.end_of_week) }
  scope :due_this_month, -> { where(due_date: Time.current.end_of_month) }
end
