class FavoritesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        favorite = current_user.favorites.build(post: @post)
        authorize favorite
        
        if favorite.save
            flash[:notice] = "You have successfully favorited this post."
        else
            flash[:error] = "There was a problem. Please try again."
        end
        redirect_to [@post.topic, @post]
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        favorite = current_user.favorites.find(params[:id])
        authorize favorite
        
        if favorite.destroy
            flash[:notice] = "Removed favorite."
        else
            flash[:error] = "There was a problem. Please try again."
        end
        redirect_to [@post.topic, @post]
    end
end