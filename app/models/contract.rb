class Contract < ActiveRecord::Base
  belongs_to :leader
  belongs_to :project
end
