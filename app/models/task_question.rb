class TaskQuestion < ActiveRecord::Base
  belongs_to :task
  attr_accessible :message, :type_questioning

  default_scope order('created_at DESC')
end
