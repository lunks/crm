class Customer < ActiveRecord::Base
  has_many :projects, :dependent=>:destroy
  has_many :contracts, :through => :projects

  validates_presence_of :name, :description

  validates_uniqueness_of :name
  validates_inclusion_of :rating, :in => "1".."5"
  
  with_options :allow_nil=>true do |c|
    c.validates_numericality_of :phone_country_code
    c.validates_numericality_of :phone_area_code
    c.validates_format_of :phone_number, :with => /^(\d|\s|-)+$/
  end

  composed_of :phone, :mapping => [
    %w(phone_country_code),
    %w(phone_area_code),
    %w(phone_number)
  ]

end