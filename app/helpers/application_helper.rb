module ApplicationHelper

# Returns the URL to delete a user
def delete_user_url(object)
  return "/users/#{object.id}"
end


end
