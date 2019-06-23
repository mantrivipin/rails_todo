class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, uniqueness: true
  
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :tasks, dependent: :destroy
  
  def admin?
    user_type == 'A'
  end
end
