class Task < ActiveRecord::Base
  belongs_to :owner
  belongs_to :project
end
