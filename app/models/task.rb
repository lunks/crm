class Task < ActiveRecord::Base
  STATUS = %w(open closed)
  PRIORITY = %w(normal low high)

  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  belongs_to :project

  validates_presence_of :title, :project_id, :description, :owner_id
  validates_numericality_of :progress, :only_integer => true, :allow_nil => true

  validates_inclusion_of :status, :in => STATUS
  validates_inclusion_of :priority, :in => PRIORITY

  after_create :register_create, { log_changes "create"  }
  after_update :register_update, { log_changes "update" }

protected
  def log_changes(state)
    Log.create(:message => "#{self.owner.name} #{state}: #{self.title}")
  end

end