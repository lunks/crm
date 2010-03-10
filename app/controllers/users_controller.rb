class UsersController < ApplicationController
  skip_before_filter :require_user, :only=>[:new, :create]
  
  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # PUT /users/1
  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to root_url
    else
      render :action => "edit"
    end
  end

end