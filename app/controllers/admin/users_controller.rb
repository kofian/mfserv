class Admin::UsersController < Admin::ApplicationController
    
    before_filter :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    
    def show
    end

  def edit
  end  
  def update_password
    @user = User.find(params[:id])
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :email, :password_confirmation)
    end
    
end