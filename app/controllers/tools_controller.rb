class ToolsController < ApplicationController
  before_action(:set_photo, { :only => [:show, :toggle_availability, :edit, :update, :destroy] })


  def set_photo
    @tool = Tool.find(params[:id])
  end

  def index
    @tools = Tool.all
  end


  def show
    @owner = User.where({ :id => @tool.user_id })
  end


  def toggle_availability
    # TODO ask Jack how to DRY this up into the model
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']

    if @tool.available == true
      @tool.available = false
      message = "Hey – can I borrow your #{@tool.tool_name}?"
    elsif @tool.available == false
      @tool.available = true
      message = "Can you let me know when your #{@tool.tool_name} is available?"
    end
    @tool.save

    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      :from => '+12245854611',
      :to => '+17732630868',
      :body => message,
    )
    redirect_to "/tools/#{@tool.id}", :notice => "Tool availability has been updated!"
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
  end


  def update
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
    @tool.destroy
    redirect_to "/tools", :notice => "Tool deleted."
  end
end
