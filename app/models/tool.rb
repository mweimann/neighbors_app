class Tool < ActiveRecord::Base

  def owner
    return User.find_by({ :id => self.user_id })
  end

  def send_availability_text(account_sid, auth_token)
    if self.available
      message = "Hey – can I borrow your #{self.tool_name}?"
      self.available = false
    elsif self.available == false
      message = "Can you let me know when your #{self.tool_name} is available?"
      self.available = true
    end

    self.save


    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create(
      :from => '+12245854611',
      :to => '+17732630868',
      :body => message,
    )
  end
end
