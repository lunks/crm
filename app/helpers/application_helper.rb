# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def percentage_options_for_select
    (0..100).collect{|i| ["#{i}%", i] }
  end

end
