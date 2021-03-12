class FavoritesController < ApplicationController
    
    def create
        @favorite = current_user.favorites.create(micropost_id: params[:micropost_id])
        flash[:success] = 'お気に入りに登録しました。'
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @micropost = Micropost.find(params[:micropost_id])
        @favorite = current_user.favorites.find_by(micropost_id: @micropost.id)
        @favorite.destroy
        flash[:success] = 'お気に入りを解除しました。'
        redirect_back(fallback_location: root_path)
    end
end
