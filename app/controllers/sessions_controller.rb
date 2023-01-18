class SessionsController < ApplicationController
  skip_before_action :user_logged_in?

  def new
    redirect_to root_path if logged_in?
  end

  def create
    if check_params
      employee = Employee.find_by(account: employee_params[:account], password: employee_params[:password])
      if employee
        login(employee)
        redirect_to root_path
      else
        flash.now[:alert] = 'アカウントもしくはパスワードが一致しません。'
        render 'new'
      end
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end

  private
  def check_params
    if employee_params[:account].blank?
      flash.now[:alert] = 'アカウントが入力されていません。'
      return false
    end
    if employee_params[:password].blank?
      flash.now[:alert] = 'パスワードが入力されていません。'
      return false
    end
    # if employee_params[:email].blank?
    #   flash.now[:alert] = 'メールアドレスが入力されていません。'
    #   return false
    # end
    # if employee_params[:date_of_joining].blank?
    #   flash.now[:alert] = '入社年月日が入力されていません。'
    #   return false
    # end
    true
  end

  def employee_params
    params.require(:employees).permit(:account, :password)
  end
end
