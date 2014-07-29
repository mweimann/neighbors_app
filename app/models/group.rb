class Group < ActiveRecord::Base
  # A group has many memberships

  def memberships
    return Membership.where({ :group_id  => self.id })
  end

  # A group has many members
  def members
    return User.where({ :id => memberships.pluck(:user_id) })
  end

  # def members
  #   return User.where({ :id => self.user_id })
  # end

  # A group has many tools
  def tools
    return Tool.where({ :user_id => members.pluck(:id) })
  end


end
