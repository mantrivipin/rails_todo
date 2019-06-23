class ProjectUser < ApplicationRecord
  validates :user_id, :project_id, presence: true
  validates :user_id, uniqueness: { scope: :project_id, message: "has already been added" }
  
  belongs_to :project
  belongs_to :user
end