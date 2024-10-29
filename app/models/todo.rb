class Todo < ApplicationRecord
  belongs_to :user
  validates :task, presence: true
  validates :completed, inclusion: { in: [true, false] }
end
