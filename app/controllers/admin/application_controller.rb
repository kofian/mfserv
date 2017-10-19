class Admin::ApplicationController < ApplicationController
    before_action :require_admin

    
  private  
  def require_admin
    unless current_user.role == 'admin'
      redirect_to root_path, alert: 'NOT AUTHORIZED!! Redirecting to home page..'
    end
  end
    
end    