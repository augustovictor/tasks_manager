class Category < ActiveRecord::Base
  # attr_accessible :name

  default_scope order('name')

  has_and_belongs_to_many :tasks, join_table: :categorizations
end
