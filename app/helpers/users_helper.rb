module UsersHelper
  def user_status(user)
    user.status == 'active' ? 'Deactivate' : 'Activate'
  end
end
