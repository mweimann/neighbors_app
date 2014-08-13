class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end


  def show
    @tool = Tool.find(params[:id])
    # @user = Tool.where({ :user_id =>  })

    @owner = User.where({ :id => @tool.user_id })
  end

  def toggle_availability
    @tool = Tool.find(params[:id])

    # TODO ask Jack how to DRY this up into the model

    # require 'rubygems'
    # require 'twilio-ruby'
    # account_sid = 'AC713e0f4afe156f0a384b77049b729afc'
    # auth_token = '84f723424756c4bfc253817c97e467d3'
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
    # account_sid = APP_CONFIG['account_sid']
    # auth_token = APP_CONFIG['auth_token']

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
