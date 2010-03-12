class CustomerSweeper < ActionController::Caching::Sweeper
  observe Customer
  
  def after_save(customer)
    expire_cache(customer)    
  end
  
  def after_destroy(customer)
    expire_cache(customer)
  end  
  
  def expire_cache(customer)
    expire_fragment :controller=>"customers", :action=>"index"
    # expire_page "/contracts/show"
    # expire_action "index"
  end
  
end