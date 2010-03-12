# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def percentage_options_for_select
    (0..100).collect{|i| ["#{i}%", i] }
  end

  def flash_notices
    [:notice, :error, :warning].collect do |type|
      content_tag('div', flash[type], :class=>"message #{type}", :id => "flash_messages") if flash[type]
    end
  end

end