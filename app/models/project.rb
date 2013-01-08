class Project < ActiveRecord::Base

  before_save :titleize_name

  attr_accessible :description, :name

  validates :name, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  delegate :email, :name, to: :owner, prefix: true

  has_many :tasks, dependent: :restrict
  # has_many :participants
  has_many :participants
  has_and_belongs_to_many :users

  # default_scope order('created_at DESC')
  scope :recent, order('created_at desc')
  scope :order_name, order('name')

  def participant?(user)
    self.users.include?(user)
  end

  def titleize_name
    self.name = name.titleize
  end

  def owner?(user)
    self.owner == user
  end

end
