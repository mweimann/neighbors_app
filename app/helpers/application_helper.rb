module ApplicationHelper
  # Returns URL for the show page of a tool
  def tool_url(object)
    if object.class == Tool
      return "/tools/#{object.id}"
    else
      return "/tools/#{object}"
    end
  end

  # Returns URL for the edit page of a tool
  def edit_tool_url(object)
      return "/tools/#{object.id}/edit"
  end

  # Returns URL for the edit page of a tool
  def delete_tool_url(object)
      return "/tools/#{object.id}"
  end

# ==========================================

  # Returns URL for the show page of a group
  def group_url(object)
    if object.class == Group
      return "/groups/#{object.id}"
    else
      return "/groups/#{object}"
    end
  end

  # Returns URL for the edit page of a group
  def edit_group_url(object)
      return "/groups/#{object.id}/edit"
  end

  # Returns URL for the edit page of a group
  def delete_group_url(object)
      return "/groups/#{object.id}"
  end


end
