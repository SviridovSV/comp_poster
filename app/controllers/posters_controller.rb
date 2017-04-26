class PostersController < ApplicationController
  before_filter :authenticated_user_only, except: :index

  def index
    @posters = Poster.all
  end

  def create
    @poster = current_user.posters.build(poster_params)
    if @poster.save
      flash.now[:success] = "Post created"
    else
      flash.now[:error] = "Something wrong"
    end
    render 'index'
  end

  private

  def poster_params
    params.require(:poster).permit(:content, :user_id)
  end
end