xml.instruct! :xml, :version=>"1.0"
xml.rss :version=>"2.0" do
  xml.channel do
    xml.title "Tasks"
    xml.link tasks_path
    xml.pubDate @tasks.first.created_at.rfc822 if @tasks.any? 
    
    xml.language('pt-br')
    @tasks.each do |task| 
      xml.item do 
        xml.title "Task #{task.id.to_s } for project #{task.project.name}"
        xml.description task.description 
        xml.link        task_path(task) 
        xml.pubDate     task.created_at.rfc822 
        xml.guid        task_path(task) 
      end 
    end 

  end
end