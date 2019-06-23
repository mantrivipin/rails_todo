class Task < ApplicationRecord
  validates :title, :description, :project_id, :user_id, presence: true
  validates :title, uniqueness: { scope: :project_id }
  STATUS = ['New', 'Progress', 'Done']
  belongs_to :project
  belongs_to :user
end
