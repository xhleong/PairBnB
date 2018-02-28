class UsersController < Clearance::UsersController

def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
      UserMailer.signup_confirmation(@user).deliver_now
    else
      render template: "users/new"
    end
  end

private
  def user_params
    params[:user].permit(:email, :password, :first_name, :last_name, :gender, :birthday, :country, :avatar)
  end

end