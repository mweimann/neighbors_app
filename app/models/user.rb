class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def tools
    return Tool.where({ :user_id => self.id })
  end

  # A user can be a member of many groups
  def memberships
    return Membership.where({ :user_id => self.id })
  end

  # A user's groups
  def groups
    return Group.where({ :id => memberships.pluck(:group_id) })
  end

end
