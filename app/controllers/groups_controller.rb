class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @members = User.all
  end


  def new
    @group = Group.new
  end

  def create
    @group = Group.new
    @group.group_name = params[:group_name]
    @group.creator_id = current_user.id
    if @group.save
      @membership = Membership.new
      @membership.group_id = @group.id
      @membership.user_id = @group.creator_id
      @membership.save
      redirect_to "/groups", :notice => "Group created successfully."
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    @group.group_name = params[:group_name]

    if @group.save
      redirect_to "/groups", :notice => "Group updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])

    @group.destroy

    redirect_to "/groups", :notice => "Group deleted."
  end
end
