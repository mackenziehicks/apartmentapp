class AdminController < ApplicationController

  #GET 'admin#index'
  def index
    if !current_user.nil? && current_user.has_role?(:admin)
      @users= User.all
    else
      redirect_to "/"
    end
  end

  #PUT/PATCH 'admin/:id'
  def update
    if !current_user.nil? && current_user.has_role?(:admin)
      user = User.find(params[:user_id])
      user.remove_role(:owner)
      user.add_role :admin
      redirect_to '/admin/index'
    else
      redirect_to "/"
    end
  end

  def remove_admin
    user = User.find(params[:user_id])
    user.remove_role :admin
    user.add_role :owner
    redirect_to '/admin/index'
  end

end
