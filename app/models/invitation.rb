class Invitation < ActiveRecord::Base
  # Belongs to one user
  # def sender
  #   return User.find_by({ :id => self.sender_id })
  # end
  belongs_to :sender, :class_name => "User"

  # has_one :recipient_email

  # Has many recipient IDs
  # def group
  #   return Group.find_by({ :id => self.group_id })
  # end

end
