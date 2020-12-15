module ApplicationHelper
  def show_photo(user, extra_class = '')
    if user.photo.present?
      image_tag(user.photo.to_s, alt: user.username, class: "pr-2 rounded-circle profile-img #{extra_class}")
    else
      image_tag('default_photo',
                alt: user.username, class: 'pr-2 rounded-circle profile-img')
    end
  end

  def validate_session
    if current_user.present?
      render 'layouts/main_app'
    else
      render 'layouts/form_sessions'
    end
  end

  def display_photo_profile(user, size)
    
    if user.photo.url == 'default_photo.png'
      image_tag user.photo.url, 
      class: "img-fluid  col-6 | mx-auto |  p-2 | my-auto ", 
        style: 'max-width:120px;'
    else
      image_tag user.photo.url(size), 
      class: "img-fluid  col-6 | mx-auto | pt-4 p-2 | my-auto "
    end
  end


end
