module ApplicationHelper
  def login_user?(obj)
    obj.user.id == current_user.id
  end
end
