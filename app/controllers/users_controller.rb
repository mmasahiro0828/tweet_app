class UsersController < ApplicationController
  before_action :login_required, except: [:new, :create, :show, :index]
  before_action :authenticated_user, only: [:edit, :destroy]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    @user.image_name = "default_image.jpg"
    
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user), notice: "ユーザーを登録しました。"
    else
      render :new
    end
    
  end
  
  def update
    @user = User.find(params[:id])
    
    
    
    if @user.authenticate(user_params[:password]) == false
      @user.errors.add(:password, "が違います")
      render :edit
    elsif  @user.update(user_params)
      
      if user_params[:image_name]
      @user.image_name = "#{@user.id}.jpg"
      @user.save
      image = user_params[:image_name]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
      end
      
      redirect_to user_url(@user), notice: "ユーザー情報を変更しました。"
    else
      render :edit
    end
  
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end
    
    
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name)
  end
  

end
