module ApplicationHelper

  def current_user
    User.all[0]
  end

end
