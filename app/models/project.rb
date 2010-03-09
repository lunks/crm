class Project < ActiveRecord::Base
  belongs_to :customer

  has_many :contracts
  has_many :tasks

  has_and_belongs_to_many :members, 
      :class_name => "User", 
      :join_table => "projects_members", 
      :association_foreign_key => "member_id"

  delegate :name, :to => :customer, :prefix=>true

  named_scope :actives, :conditions => {:active => true}
  named_scope :inactives, :conditions => {:active => false}

  validates_associated :customer
  validates_presence_of :customer, :name
  validates_uniqueness_of :name
end
