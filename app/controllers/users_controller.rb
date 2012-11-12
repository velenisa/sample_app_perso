class UsersController < ApplicationController
  
  before_filter :signed_in_user, :only => [:edit, :index, :show, :update, :destroy,:new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy]

  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User Successfully Created"
      redirect_to users_url
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user && !current_user.admin?
      flash[:error] = "You cannot see this user"
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user && !current_user.admin?
      flash[:error] = "You cannot edit this user"
      redirect_to root_path
    else @user != current_user &&  current_user.admin?
      render 'edit'
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User Successfully updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
end

    private
     
     def signed_in_user
      unless signed_in?
        store_location
        #redirect_to signin_url, notice: "Please sign in."
        flash[:notice] = "Please sign in."
        redirect_to signin_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
     def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
