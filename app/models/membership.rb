class Membership < ActiveRecord::Base
  validates :group, :presence => true
  validates :member, :presence => true

  def member
    return User.find_by({ :id => self.user_id })
  end

  # Belongs to one group_id
  def group
    return Group.find_by({ :id => self.group_id })
  end


end
