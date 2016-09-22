class AdminController < ApplicationController
  def index
    if !current_user.nil? && current_user.has_role?(:admin)
      @users= User.all
    else
      redirect_to "/"
    end
  end

  def update
    if !current_user.nil? && current_user.has_role?(:admin)
      user = User.find(params[:user_id])
      user.roles.each do |role|
        user.remove_role(role)
      end
      user.add_role :admin
    else
      redirect_to "/"
    end
  end
  # def remove_admin
  #   user = User.find(params[:user_id])
  #   user.remove_role :admin
  #   render '/admin/update/' + user.id.to_s
  # end

end
