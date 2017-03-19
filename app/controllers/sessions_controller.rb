class SessionsController < ApplicationController
  def create
    begin
      if(current_user)
        User.add_social(request.env['omniauth.auth'], current_user)
      else
        @user = User.from_omniauth(request.env['omniauth.auth'])
        if @user.banned
          flash[:warning] = 'You are banned on this resource'
        else
          session[:id] = @user.id
          flash[:success] = 'Welcome'
        end
      end
    rescue
      flash[:warning] = 'Something bad happened while authenticating'
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      current_user.last_activity = Time.now
      current_user.save!
      session[:id] = -1
      flash[:success] = 'Chiao'
    end
    redirect_to root_path
  end
end
