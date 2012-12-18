class Task < ActiveRecord::Base

  resourcify

  attr_accessible :deadline, :description, :done, :name, :priority, :assignments_attributes, :user_ids

  belongs_to :project
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  delegate :email, :name, to: :owner, prefix: true

  has_many :task_questions
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments

  default_scope order: 'priority DESC'
  default_scope order: 'created_at DESC'

  accepts_nested_attributes_for :assignments, reject_if: :all_blank, allow_destroy: true

  validates :name, :user_ids, presence: true
  validates :name, uniqueness: true


  def self.done
    where(done: true)
  end

  def self.to_do
    where(done: false)
  end
end
