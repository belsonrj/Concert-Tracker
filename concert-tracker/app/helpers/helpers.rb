class Helpers
  def self.current_user(session_hash)
    @user = User.find(session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)
    !!session_hash[:user_id]
  end
  
  def redirect_if_not_logged_in
    if !logged_in?
      redirect "/login?error=You have to be logged in to do that"
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end