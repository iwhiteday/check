class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def ban
    if(current_user&.privileged)
      user = User.find(params[:id])
      user.banned = true
      if(user.save)
        redirect_to users_path
      else
        flash[:warning] = 'Ban failed'
      end
    end
  end

  def unban
    if(current_user&.privileged)
      user = User.find(params[:id])
      user.banned = false
      if(user.save)
        redirect_to users_path
      else
        flash[:warning] = 'Ban failed'
      end
    end
  end

end
