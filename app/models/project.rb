class Project < ActiveRecord::Base

  attr_accessible :description, :name

  validates :name, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  delegate :email, :name, to: :owner, prefix: true

  has_many :tasks, dependent: :destroy
  has_many :participants
  has_many :users, through: :participants

  default_scope order('created_at DESC')

end
