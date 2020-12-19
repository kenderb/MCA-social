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
                class: 'user-photo-border'

    else
      image_tag user.photo.url(size),
                class: 'user-photo-border'

    end
  end

  def display_photo_profile_users_page(user, size)
    if user.photo.url == 'default_photo.png'
      image_tag user.photo.url,
                class: 'user-photo-border-big'

    else
      image_tag user.photo.url(size),
                class: 'user-photo-border-big'

    end
  end

  def follow_icon
    if current_page?(root_path)
      '<ion-icon name="add-circle-outline" class="h1">addCricle</ion-icon>'.html_safe
    else
      '<ion-icon name="add-circle-outline" style="font-size: 50px;">addCricle</ion-icon>'.html_safe
    end
  end

  def show_sidebar
    if current_page?(root_path)
      render 'layouts/aside_index'
    else
      render 'users/left_user_aisde'
    end
  end
end
