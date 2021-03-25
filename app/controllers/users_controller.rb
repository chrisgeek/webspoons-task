class UsersController < ApplicationController
  before_action :set_user, only: %i[toggle_status show edit update remove]

  def index
    @user = User.new
    @users = if params[:query].present?
               User.search(params[:query]).page params[:page]
             else
               sorted_data
             end
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end

  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    value = @user.status == 'active' ? 'inactive' : 'active'
    respond_to do |format|
      if @user.update(status: value)
        format.html { redirect_to users_url, notice: "User was successfully made #{value.humanize}." }
        format.json { head :no_content }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def remove
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully Removed.' }
      format.json { head :no_content }
    end
  end

  def search
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def sorted_data
    if params[:sort]
      User.order(params[:sort]).page params[:page]
    else
      User.page params[:page]
    end
  end

  def user_params
    params.fetch(:user).permit(:email, :title, :name, :phone, :status)
  end
end
