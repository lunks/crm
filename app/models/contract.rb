class Contract < ActiveRecord::Base
  STATUS = %w(prospecting accepted canceled)

  belongs_to :leader, :class_name => "User", :foreign_key => "leader_id"
  belongs_to :project

  validates_presence_of :name, :leader, :project,
    :code, :started_at, :description

  validates_associated :leader, :project

  validates_inclusion_of :status, :in => STATUS
end