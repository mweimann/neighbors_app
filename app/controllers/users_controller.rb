class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tools = Tool.where({ :user_id => @user.id })
  end

  def new
    @user = User.new
  end

  # def create
  #   @user = User.new
  #   # @user.id = params[:id]
  #   @user.username = params[:username]
  #   @user.email = params[:email]
  #   @user.username = params[:username]
  #   @user.username = params[:password]


  #   if @user.save
  #     redirect_to "/users", :notice => "New user created successfully."
  #   else
  #     render 'new'
  #   end
  # end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        session[:username] = @user.username
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.id = params[:group_id]

    if @user.save
      redirect_to "/users", :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to "/users", :notice => "User deleted."
  end
end
