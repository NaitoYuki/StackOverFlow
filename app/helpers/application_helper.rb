module ApplicationHelper
  def login_user?(obj)
    if user_signed_in?
      obj.user.id == current_user.id
    end
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

  def markdown(text)
    render_options = {
      filter_html: false,
      hard_wrap: true
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
      lax_spacing: true,
      space_after_headers: true,
      superscript: true,
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
