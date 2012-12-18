class Project < ActiveRecord::Base

  resourcify

  attr_accessible :description, :name

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  delegate :email, :name, to: :owner, prefix: true

  has_many :tasks, dependent: :destroy

  default_scope order('created_at DESC')

end
