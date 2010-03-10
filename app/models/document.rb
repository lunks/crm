class Document < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :title,:project
  validates_associated :project

  has_attached_file :document, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :document,
       :content_type => %w(image/jpg
                           image/jpeg
                           image/pjpeg
                           image/gif
                           image/png
                           image/x-png
                           application/msword
                           application/pdf)

   validates_attachment_size :document,
       :less_than => 5.megabytes

end