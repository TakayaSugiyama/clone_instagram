module SessionsHelper 
  def login?
    if session[:user_id]
      true 
    else 
       false 
    end
  end

  def current_user 
    @current_user = User.find(session[:user_id])
  end
end