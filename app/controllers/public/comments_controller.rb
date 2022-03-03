class Public::CommentsController < ApplicationController

  layout 'user'

  def create
    @cities = City.all
    @post_ranks = Post.find(PostFavorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post)
    else
      render template: "public/posts/show"
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end

end
