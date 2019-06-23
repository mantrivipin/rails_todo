class Project < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
  has_many :tasks, dependent: :destroy
end
