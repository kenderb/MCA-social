module ApplicationHelper
  def show_photo(user, extra_class = '')
    if user.photo.present?
      image_tag(user.photo.to_s, alt: user.username, class: "pr-2  profile-img #{extra_class}")
    else
      image_tag('default_photo',
                alt: user.username, class: 'pr-2  profile-img')
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
      class: "img-fluid  mx-auto  p-3  my-auto user-photo-border", 
        style: 'max-width:120px;'
    else
      image_tag user.photo.url(size), 
      class: "img-fluid  mx-auto  pt-4 p-3  my-auto user-photo-border", 
        style: 'max-width:130px;'
    end
  end


end
