class SessionsController < ApplicationController

  skip_before_filter :require_login
  before_action :redirect_if_logged_in, only: [:new]

  def new
    @user = User.new

    render :new
  end

  def create
    if params[:user][:login] == "Guest"
      @user = User.find_by(username: "Guest")
      reset_guest
    else
      @user = User.find_by_credentials(params[:user][:login], params[:user][:password])
    end

    if log_in!(@user)
      redirect_to '#feed'
    else
      flash[:error] = ["Invalid Login"]
      redirect_to new_sessions_url
    end

  end

  def destroy
    log_out!
    redirect_to new_sessions_url
  end

  def omniauth
    @user = User.find_or_create_by_auth_hash(auth_hash)

    if @user.email
      log_in!(@user)
      redirect_to '#feed'
    else
      render :omniauth
    end

  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end

  private
  def redirect_if_logged_in
    redirect_to '#feed' if logged_in?
  end

  def reset_guest
    user = User.find_by(username: "Guest")
    user.logs.destroy_all
    user.shoes.destroy_all
    user.blogs.destroy_all
    user.comments.destroy_all
    user.follows_follows.destroy_all

    create_guest_details(user)
  end

  def create_guest_details(guest)

    guest.update!(
      profile_pic_file_name: nil,
      profile_pic_content_type: nil,
      profile_pic_file_size: nil,
      profile_pic_updated_at: nil
    )


    gs1 = guest.shoes.create!(
      name: "Guest Trainers",
      distance: 0
    )
    guest.blogs.create!(
      title: "Runlogr Intro",
      body: "#Welcome to Runlogr\r\n\r\nAs a Guest you may roam the site freely.
      You can change some account settings and add blogs, logs, and comments.
      \r\n\r\n##Restrictions\r\n\r\nAs a Guest you cannot change most user details,
      though you can upload a new picture. All comments, blogs, and logs will be reset
      upon the next guest log in.\r\n\r\n##Sign Up\r\n\r\nLog out to sign up for your
      own account to save anything you want!",
      preview: "Some basic details about the Runlogr Guest."
    )

    guest.logs.create!(
      title: 'New Year Run',
      date: Date.new(2015, 1, 1),
      distance: 5,
      duration: 8 * 60 * 5,
      notes: 'Add notes for details about a run!',
      shoe_id: gs1.id
    )
    guest.logs.create!(
      title: 'Long Run',
      date: Date.new(2015, 1, 2),
      distance: 12,
      duration: 9 * 60 * 12,
      notes: '',
      shoe_id: gs1.id
    )
    guest.logs.create!(
      title: 'untitled',
      date: Date.new(2015, 1, 3),
      distance: 3,
      duration: 8 * 60 * 3,
      notes: '1mi warm up, 4x400m w/ 400m recovery. Splits: 88,92,90,86',
      shoe_id: gs1.id
    )
    guest.follows_follows.create!(
      leader_id: User.find_by(username: "FunRunner85").id
    )
    guest.follows_follows.create!(
      leader_id: User.find_by(username: "RoadRunner82").id
    )
    guest.follows_follows.create!(
      leader_id: User.find_by(username: "TrailBro88").id
    )
  end

end
