class HomeController < ApplicationController
  before_action :authenticate_user, {only:[:edit]} 
  before_action :check_online_status, {only:[:edit, :top]}
  
  def top
  end

  def login_form
    if session[:user_id] != nil
      redirect_to("/edit")
    end
    @user_name = nil
    @password = nil
  end

  def edit
    @statuses = Status.all.order(id: :desc)
  end

  def login
    @user = User.find_by(name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to("/edit")
    else
      @error_message = "ログインに失敗しました"
      render("login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def change_status
    latest_status = Status.last
    if !latest_status || latest_status.status == "offline"
      status = Status.new(status: "online")
      status.save
    else
      latest_status.status = "offline"
      latest_status.save
    end
    redirect_to("/edit")
  end

  def extend
    latest_status = Status.last
    if latest_status.status == "online"
      latest_status.status = "extended"
      latest_status.save
    end
    redirect_to("/edit")
  end

  def destroy_log
    status = Status.find_by(id: params[:id])
    status.destroy
    redirect_to("/edit")
  end

  def authenticate_user
    if session[:user_id] == nil
      redirect_to("/")
    end
  end

  def check_online_status
    latest_status = Status.last
    if latest_status.status == "online"
      @status_message = "現在、サイエンスラウンジ開催中です。<br>下のボタンから参加してください。".html_safe
    elsif latest_status.status == "extended"
      @status_message = "現在、時間を延長して開催中です。今ならまだ間に合うかも！<br>下のボタンから参加してください。".html_safe
    else
      @status_message = "現在オフラインです。"
    end
  end

end
