class ProfileController < ApplicationController
  def show
    @profile = Profile.where(:user_id => params[:id]).first
    if @profile.nil?
      redirect_to new_profile_path(params[:id])
    else
      @user = params[:id]
      @publications = Ppublication.where(:user_id => params[:id])
      @keywords = Keyword.get_for_user(params[:id])
      unless @profile[:phone].nil?
        @phone_num = Profile.format_phone(@profile[:phone])
      end
    end
  end

  def new
    if !current_user.nil? && current_user['id'].to_s == params[:format]
      @profile = Profile.new
      @profile.user_id = params[:format]
      @profile.save
      redirect_to edit_profile_path(params[:format])
    else
      flash[:notice] = "You do not have permission to do that."
      redirect_to '/'
    end
  end

  def edit
    @user = params[:id]
    @profile = Profile.where(:user_id => params[:id]).first
    if(@profile.nil?)
      redirect_to new_profile_path(params[:id])
    elsif !current_user.nil? && current_user['id'].to_s == @user
      @publications = Ppublication.where(:user_id => params[:id])
      @keywords = Keyword.get_for_user(params[:id])
    else
      flash[:notice] = "You do not have permission to do that"
      redirect_to '/'
    end
  end

  def update
    profile = Profile.where(:user_id => params[:id]).first
    Ppublication.update({:id => params[:id], :data => params['pub']})

    Pkeyword.update({:id => params[:id], :data => params['keyword']})

    if params['user'].key?('picture_check') && params['user']['picture_check']
      profile.remove_pic
    end
    params['user'].delete('picture_check')

    profile.update_attributes(params['user'])
    flash[:notice] = "Profile was successfully updated!"
    redirect_to profile_path(params[:id])

  end
end
