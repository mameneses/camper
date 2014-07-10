helpers do

  def current_user
    if session[:id]
      session[:id]
    end
  end

  def user_exists?(user_email)
    User.find_by_email(user_email) != nil
  end

  def create_new_user
    @user = User.new()
    @user.first_name = @first_name
    @user.last_name = @last_name
    @user.email = @email
    @user.password = @password
    if @user.valid?
      @user.save!
      redirect '/'  
    else
      flash.now[:notice] = erb :register_errors
    end
  end

  def login
    if user_exists?(params[:email])
      @user = User.find_by_email(params[:email])
      if @user.password == params[:password]
        session[:id] = User.find_by_email(params[:email]).id
        redirect"/users/#{session[:id]}/favorites"
      else
        redirect '/'
      end
    else
      redirect'/'
    end
  end
end