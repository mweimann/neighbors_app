class Group < ActiveRecord::Base
  # A group has many memberships

  def memberships
    return Membership.where({ :group_id  => self.id })
  end

  # A group has many members
  def members
    return User.where({ :id => memberships.pluck(:user_id) })
  end

  # A group has many tools
  def tools
    return Tool.where({ :user_id => members.pluck(:id) })
  end

  # CREATOR - probably similar to instagram photo
  # A group has one creator
  def creator
    return User.find_by({ :id => self.creator_id })
  end


end
