require 'securerandom'

class UsersController < Clearance::UsersController
  skip_before_filter :verify_authenticity_token, only: [:forgot_action]
  skip_before_filter :authorize, only: [:create, :new, :forgot_password, :forgot_action]
  before_filter :avoid_sign_in, only: [:create, :new, :forgot_password, :forgot_action], if: :signed_in?

  def new
    session[:id] = nil
    @user = user_from_params
    if session[:id].nil?
      flash[:notice] = "The Activation link provided is either expired or invalid"
      redirect_to ("/")
    else
      render template: 'users/new'
    end
  end
  
  def update
    if validatePassword
      current_user.change_password(user_params.delete(:password))
      flash[:notice] = "Updated password successfully"
      redirect_to root_path
    else
      redirect_to(:back)
    end
  end
  
  def reset
    if signed_in?
      @user = current_user
      @url = "#{users_path}/#{current_user['id']}"
    else
      if !(params[:aid].nil?) && !(Suser.find_by_activation_link(params[:aid]).nil?)
         email = Suser.find_by_activation_link(params[:aid]).email
         id = Suser.find_by_activation_link(params[:aid]).id
         @user = User.find_by_email(email)
         Suser.destroy(id)
         sign_in @user
         redirect_to reset_path
      else 
        flash[:notice] = "Invalid reset link"
        redirect_to root_path
      end

    end
  end
  
  def forgot_password  
  end
  
  def forgot_action
    email = params[:user][:email]
    suser = Suser.find_by_email(email)
    if User.find_by_email(email).nil?
      flash[:notice] = "Invalid email address"
    else
      if suser.nil?
        Suser.reset_suser(email, request.host_with_port)
      else
        suser.re_send_reset(request.host_with_port)
      end
      flash[:notice] = "An email will be sent to you with further instructions"
    end
    redirect_to root_path
  end

  def create
    passcheck = validatePassword();
    @user = user_from_params
      if !passcheck
        redirect_to ("/activate?aid=" + Suser.find_by_id(session[:id]).activation_link)
      else
        if @user.save
          Suser.destroy(session[:id])
          session[:id]=nil
          sign_in @user
          redirect_back_or url_after_create
        end
      end
  end
  
  private

  def avoid_sign_in
    redirect_to Clearance.configuration.redirect_url
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    user_params.delete(:re_password)
    if !(params[:aid].nil?) && !(Suser.find_by_activation_link(params[:aid]).nil?)
      session[:id] = Suser.find_by_activation_link(params[:aid]).id   
    end
    
    Clearance.configuration.user_model.new(user_params).tap do |user|
      if session[:id].nil?
        user.email = email
      else
        user.email = Suser.find_by_id(session[:id]).email
      end
      user.password = password
      user.urole_id = User.get_user_role
      user.status_id = Status.find_by_code('PAPP').id
    end
  end

  def user_params
    params[:user] || Hash.new
  end

  def validatePassword()  
    password = user_params[:password]
    re_password = user_params[:re_password]
    if password != re_password
      flash[:notice] = "The passwords do not match."
      return false
    elsif password.length < 6
      flash[:notice] = "Password must contain atleast six characters."
      return false
    elsif !(password.match(/[A-Z]+/))
      flash[:notice] = "Password must contain atleast one upper case letter"
      return false
    elsif !(password.match(/[a-z]+/))
      flash[:notice] = "Password must contain atleast one lower case letter"
      return false
    elsif !(password.match(/[\d]+/)) 
      flash[:notice] = "Password must contain atleast one numeric character"
      return false      
    else
      return true
    end
  end
end
