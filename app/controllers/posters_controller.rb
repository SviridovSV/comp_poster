class PostersController < ApplicationController
  before_filter :authenticated_user_only, except: :index

  def index
    @posters = Poster.default_order.paginate(page: params[:page], per_page: 8)
  end

  def create
    @poster = current_user.posters.build(poster_params)
    if @poster.save
      flash[:success] = "Post created"
    else
      flash[:warning] = "Something wrong"
    end
    redirect_to posters_path
  end

  private

  def poster_params
    params.require(:poster).permit(:content, :user_id)
  end
end