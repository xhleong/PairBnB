class UsersController < Clearance::UsersController


private
  def user_params
    params[:user].permit(:email, :password, :first_name, :last_name, :gender, :birthday, :country, :avatar)
  end

end