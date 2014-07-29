class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new
    @tool.tool_name = params[:tool_name]
    @tool.user_id = params[:user_id]
    @tool.available = params[:available]

    if @tool.save
      redirect_to "/tools", :notice => "Tool created successfully."
    else
      render 'new'
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])

    @tool.tool_name = params[:tool_name]
    @tool.user_id = params[:user_id]
    @tool.available = params[:available]

    if @tool.save
      redirect_to "/tools", :notice => "Tool updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @tool = Tool.find(params[:id])

    @tool.destroy

    redirect_to "/tools", :notice => "Tool deleted."
  end
end
