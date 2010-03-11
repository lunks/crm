class User < ActiveRecord::Base
  acts_as_authentic
  
  KIND = %w(administrator user)
  
  has_many :contracts
  has_many :tasks, :foreign_key => "owner_id"
  
  validates_presence_of :name, :email
  validates_inclusion_of :kind, :in => KIND
  
end