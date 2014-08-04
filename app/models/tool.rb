class Tool < ActiveRecord::Base

  def owner
    return User.find_by({ :id => self.user_id })
  end

  def available

  end

end
