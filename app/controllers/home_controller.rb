class HomeController < ApplicationController
  before_action :require_user
  def index
    @opinion = Opinion.new
    @opinions = Opinion.ordered_by_most_recent
    @not_following = current_user.friends_not_following
  end
end
