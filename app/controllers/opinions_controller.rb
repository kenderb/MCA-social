class OpinionsController < ApplicationController
  before_action :require_user

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:notice] = 'Your opinion has been posted'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] =
        'movie name minmun of 2 maximun of 30 characters. Movie opinion minimum: 4, maximum: 120.'
      redirect_to root_path
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:movie_name, :text)
  end
end
