class Task < ActiveRecord::Base
  STATUS = %w(open closed)
  PRIORITY = %w(normal low high)

  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  belongs_to :project

  validates_presence_of :title, :project_id, :description, :owner_id
  validates_numericality_of :progress, :only_integer => true, :allow_nil => true

  validates_inclusion_of :status, :in => STATUS
  validates_inclusion_of :priority, :in => PRIORITY

  after_create { |r| log_changes(r, "create") }
  after_update { |r| log_changes(r, "update") }

protected
  def self.log_changes(resource,state)
    Log.create(:message => "#{resource.owner.name} #{state}: #{resource.title}")
  end

end