class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user && @user.update_attributes(secure_params)
      redirect_to users_path, :notice => 'Usuario actualizado.'
    else
      redirect_to users_path, :alert => 'No se puede actualizar el usuario.'      
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "Usuario eliminado."
  end
  
  private

  def secure_params
    params.require(:user).permit(:name)
  end
end
