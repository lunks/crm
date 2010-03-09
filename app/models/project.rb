class Project < ActiveRecord::Base
  belongs_to :customer

  delegate :name, :to => :customer, :prefix=>true

  named_scope :actives, :conditions => {:active => true}
  named_scope :inactives, :conditions => {:active => false}

  validates_associated :customer
  validates_presence_of :customer, :name
  validates_uniqueness_of :name
end
