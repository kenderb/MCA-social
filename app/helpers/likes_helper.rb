module LikesHelper
  def like_or_dislike_btn(opinion)
    like = Like.find_by(opinion_id: opinion.id, user_id: current_user.id)
    if like
      link_to like_path(id: like.id, opinion_id: opinion.id), method: :delete do
        
        render 'likes/heart_full'
      end
    else
      link_to likes_path(opinion_id: opinion.id), method: :post do
        render 'likes/heart_outline'
      end
      
    end
  end
end
