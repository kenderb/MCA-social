module UserHelper
  def display_follower_count(obj)
    return 'No Followers'.html_safe unless obj.followers.count.positive?

    out = ''
    out << 'Followed by '
    out << link_to(obj.followers.first.fullname, profile_path(obj.followers.first.username))
    out.html_safe
  end
  def display_follow_btn(user, partial_file)
    return if current_user == user || current_user.follows.include?(user)
    render partial: partial_file, locals: { obj: user }
  end
end
