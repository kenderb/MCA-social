module ApplicationHelper
  def show_photo(user, extra_class = '')
    if user.photo.present?
      image_tag(user.photo.to_s, alt: user.username, class: "pr-2 rounded-circle profile-img #{extra_class}")
    else
      image_tag('default_photo',
                alt: user.username, class: 'pr-2 rounded-circle profile-img')
    end
  end
  def like_or_dislike_btn(opinion)
    like = Like.find_by(opinion_id: opinion.id, user_id: current_user.id)
    if like
      link_to('Dislike!', like_path(id: like.id, opinion_id: opinion.id), method: :delete)
    else
      link_to('Like!', likes_path(opinion_id: opinion.id), method: :post)
    end
  end
end
