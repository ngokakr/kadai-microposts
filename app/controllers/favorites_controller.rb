class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  # def show
  #   @user = User.find(params[:id])
  #   # @m = @user.favoritings.order('created_at DESC').page(params[:page])
  # end
  
  def create
    item = Micropost.find(params[:micropost_id])
    current_user.favo(item)
    flash[:success] = "お気に入りに追加しました。"
    # redirect_to root_url
    redirect_to :back
    
  end

  def destroy
    item = Micropost.find(params[:micropost_id])
    current_user.unfavo(item)
    flash[:success] = "お気に入りを解除しました。"
    # redirect_to root_url
    redirect_to :back
  end
end
