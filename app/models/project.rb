class Project < ActiveRecord::Base
  belongs_to :customer

  delegate :name, :to => :customer, :prefix=>true

  validates_associated :customer
  validates_presence_of :customer, :name
  validates_uniqueness_of :name
end
