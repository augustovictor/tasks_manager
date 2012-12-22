class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  # attr_accessible :name, :description
end
