class User < ActiveRecord::Base

  KIND = %w(administrator user)

  has_many :contracts
  has_many :tasks

  validates_presence_of :name, :login, :password
  validates_uniqueness_of :login
  validates_length_of :login, :within => 5..16
  validates_length_of :password, :within => 5..255
  validates_inclusion_of :kind, :in => KIND

  validates_confirmation_of :password, :if => :password_changed?

  def password=(new_pass)
    write_attribute(:password, new_pass) if new_pass.present?
  end

end
