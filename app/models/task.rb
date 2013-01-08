class Task < ActiveRecord::Base

  attr_accessible :deadline, :description, :done, :name, :priority, :assignments_attributes, :user_ids, :linked_task, :category_ids

  belongs_to :project
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  delegate :email, :name, to: :owner, prefix: true

  has_many :task_questions
  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments

  has_and_belongs_to_many :categories, join_table: :categorizations

  default_scope order: 'priority DESC'
  default_scope order: 'created_at DESC'

  accepts_nested_attributes_for :assignments, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :categories, reject_if: :all_black, allow_destroy: false

  validates :name, :users, :priority, presence: true
  validates :name, uniqueness: true


  def self.done
    where(done: true)
  end

  def self.to_do
    where(done: false)
  end

  def linked_task_description
    Task.find_by_id(self.linked_task).description
  end

  def linked_task_name
    Task.find_by_id(self.linked_task).name
  end

end
