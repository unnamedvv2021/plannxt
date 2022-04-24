class RegistrationsController < ApplicationController
        # instantiates new user
    def new
      @user = User.new
    end
    def create
      @user = User.new(user_params)
      if @user.save
        # deliver_now is provided by ActiveJob.
        WelcomeMailer.with(user: @user).welcome_email.deliver_now
        
        # stores saved user id in a session
        session[:user_id] = @user.id
        redirect_to sign_in_path, notice: 'Successfully created account'
      else
        render :new
      end
    end
    private
    def user_params
      # strong parameters
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
