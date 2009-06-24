class Todo < ActiveRecord::Base
  def complete?
    complete
  end  
  def complete
    !self.completed_at.nil?
  end
  
  def complete=(value)
    self.completed_at = if value
                          Date.today
                        else
                          nil
                        end
  end
  
end
