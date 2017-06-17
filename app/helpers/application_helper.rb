module ApplicationHelper
  def login_user?(obj)
    obj.user.id == current_user.id
  end

  def profile_img(user)
    return image_tag(user.avatar, alt: user.name) if user.avatar?

    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = 'no_image.png'
    end
    image_tag(img_url, alt: user.name)
  end

  def contribute(user)
    user.questions.sum(:vote_count) + user.answers.sum(:vote_count)
  end
end
