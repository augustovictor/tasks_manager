class User < ActiveRecord::Base

  attr_accessible :login_name, :name, :email, :password, :password_confirmation, :remember_me, :project_ids

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :login_name, uniqueness: true

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body

  # has_many :participants
  # has_many :projects, through: :participants
  has_and_belongs_to_many :projects#, order: 'created_at DESC'
  has_many :assignments
  has_many :tasks, through: :assignments

  def own_project?(project)
    self.projects.include?(project)
  end

  def invitable_projects
    self.projects.where(user_id: self)
  end

end
